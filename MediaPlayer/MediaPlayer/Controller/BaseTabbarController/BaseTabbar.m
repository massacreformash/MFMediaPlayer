//
//  BaseTabbar.m
//  MediaPlayer
//
//  Created by Aaron Peng on 2018/1/3.
//  Copyright © 2018年 BUPT. All rights reserved.
//

#import "BaseTabbar.h"
#import "BaseTabbarItemContainer.h"
#import "BaseTabbarItem.h"
#import "BaseTabBarItemContentView.h"
#import "BaseTabbarController.h"

@interface BaseTabbar ()

@property (nonatomic, assign) UIEdgeInsets itemEdgeInsets;
@property (nonatomic, assign) BaseTabbarItemPositioning itemCustomPositioning;
@property (nonatomic, strong) NSMutableArray<BaseTabbarItemContainer *> *containers;
@property (nonatomic, assign) BOOL isEditing;

@end

@implementation BaseTabbar

- (instancetype)init {
    self = [super init];
    if (self) {
        [self p_initOwnPreperties];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self p_initOwnPreperties];
    }
    return self;
}

#pragma mark - override funcs
- (void)beginCustomizingItems:(NSArray<UITabBarItem *> *)items {
    [super beginCustomizingItems:items];
    [BaseTabbarController printError:@"beginCustomizingItems(_:) is unsupported"];
}

- (BOOL)endCustomizingAnimated:(BOOL)animated {
    [BaseTabbarController printError:@"endCustomizing(_:) is unsupported"];
    return [super endCustomizingAnimated:animated];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self setupLayout];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL isInside = [super pointInside:point withEvent:event];
    if (!isInside) {
        for (BaseTabbarItemContainer *container in self.containers) {
            if ([container pointInside:CGPointMake(point.x - container.x, point.y - container.y) withEvent:event]) {
                isInside = true;
            }
        }
    }
    return isInside;
}

#pragma mark - setters
- (void)setItems:(NSArray<UITabBarItem *> *)items {
    [super setItems:items];
    [self p_reload];
}

- (void)setItems:(NSArray<UITabBarItem *> *)items animated:(BOOL)animated {
    [super setItems:items animated:animated];
    [self p_reload];
}

- (void)setIsEditing:(BOOL)isEditing {
    BOOL oldValue = _isEditing;
    _isEditing = isEditing;
    if (oldValue != isEditing) {
        [self setupLayout];
    }
}

- (void)setItemCustomPositioning:(BaseTabbarItemPositioning)itemCustomPositioning {
    _itemCustomPositioning = itemCustomPositioning;
    switch (itemCustomPositioning) {
            case TABBAR_POSITIONING_FILL:
            self.itemPositioning = UITabBarItemPositioningFill;
            break;
            case TABBAR_POSITIONING_AUTOMATIC:
            self.itemPositioning = UITabBarItemPositioningAutomatic;
            break;
            case TABBAR_POSITIONING_CENTERED:
            self.itemPositioning = UITabBarItemPositioningCentered;
            break;
        default:
            break;
    }
    [self p_reload];
}

#pragma mark - init
- (void)p_initOwnPreperties {
    self.itemEdgeInsets = UIEdgeInsetsZero;
    self.containers = @[].mutableCopy;
    self.isEditing = false;
}

@end

@implementation BaseTabbar (layout)

- (void)setupLayout {
    Class UITabBarButton = NSClassFromString(@"UITabBarButton");
    NSMutableArray<UIView *> *tabbarButtons = @[].mutableCopy;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:UITabBarButton]) {
            [tabbarButtons addObject:obj];
        }
    }];
    [tabbarButtons sortUsingComparator:^NSComparisonResult(UIView  * _Nonnull obj1, UIView   * _Nonnull obj2) {
        if (obj1.x < obj2.x) {
            return NSOrderedAscending;
        } else if (obj1.x > obj2.x) {
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    }];
    
    if (self.isCustomizing == true) {
        [self.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
            tabbarButtons[idx].hidden = false;
        }];
        [self.containers enumerateObjectsUsingBlock:^(BaseTabbarItemContainer * obj, NSUInteger idx, BOOL * stop) {
            obj.hidden = true;
        }];
    } else {
        [self.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
            tabbarButtons[idx].hidden = true;
        }];
        [self.containers enumerateObjectsUsingBlock:^(BaseTabbarItemContainer * obj, NSUInteger idx, BOOL * stop) {
            obj.hidden = false;
        }];
    }
    
    BOOL layoutBaseSystem = true;
    switch (self.itemCustomPositioning) {
            case TABBAR_POSITIONING_FILL:
            case TABBAR_POSITIONING_AUTOMATIC:
            case TABBAR_POSITIONING_CENTERED:
            break;
            case TABBAR_POSITIONING_FILLINCLUDESEPARATOR:
            case TABBAR_POSITIONING_FILLEXCLUDESEPARATOR:
            layoutBaseSystem = false;
            break;
        default:
            break;
    }
    
    if (layoutBaseSystem == true) {
        [self.containers enumerateObjectsUsingBlock:^(BaseTabbarItemContainer * container, NSUInteger idx, BOOL * stop) {
            container.frame = tabbarButtons[idx].frame;
        }];
    } else {
        CGFloat x = self.itemEdgeInsets.left;
        CGFloat y = self.itemEdgeInsets.top;
        switch (self.itemCustomPositioning) {
                case TABBAR_POSITIONING_FILLEXCLUDESEPARATOR:
                if (y <= 0.0) {
                    y += 1.0;
                }
                break;
            default:
                break;
        }
        CGFloat width = self.width - self.itemEdgeInsets.left - self.itemEdgeInsets.right;
        CGFloat height = self.height - y - self.itemEdgeInsets.bottom;
        CGFloat eachWidth = self.itemWidth == 0.0 ? width / (CGFloat)self.containers.count : self.itemWidth;
        CGFloat eachSpacing = self.itemSpacing == 0.0 ? 0.0 : self.itemSpacing;
        for (BaseTabbarItemContainer *container in self.containers) {
            container.frame = CGRectMake(x, y, eachWidth, height);
            x += eachWidth;
            x += eachSpacing;
        }
    }
}

@end

@implementation BaseTabbar (actions)

- (BOOL)p_isMoreItem {
    return false;
}

- (void)p_removeAll {
    [self.containers enumerateObjectsUsingBlock:^(BaseTabbarItemContainer * _Nonnull container,
                                                  NSUInteger idx, BOOL * _Nonnull stop) {
        [container removeFromSuperview];
    }];
    [self.containers removeAllObjects];
}

- (void)p_reload {
    [self p_removeAll];
    if (self.items.count == 0) {
        return;
    }
    [self.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        BaseTabbarItemContainer *container = [[BaseTabbarItemContainer alloc] initWithTarget:self tag:(1000 + idx)];
        [self addSubview:container];
        [self.containers addObject:container];
        
        if ([item isKindOfClass:[BaseTabbarItem class]]) {
            [container addSubview:(UIView *)((BaseTabbarItem *)item).contentView];
        }
    }];
    [self setNeedsLayout];
}

- (void)highlightAction:(id)sender {
    NSInteger newIndex = [self p_validateSender:sender];
    if (newIndex == NSIntegerMax) {
        return;
    }
    BaseTabbarItem *item = (BaseTabbarItem *)self.items[newIndex];
    [item.contentView highlightWithAnimation:true completion:nil];
}

- (void)dehilightedAction:(id)sender {
    NSInteger newIndex = [self p_validateSender:sender];
    if (newIndex == NSIntegerMax) {
        return;
    }
    BaseTabbarItem *item = (BaseTabbarItem *)self.items[newIndex];
    [item.contentView dehighlightWithAnimation:true completion:nil];
}

- (NSInteger)p_validateSender:(id)sender {
    if (![sender isKindOfClass:[BaseTabbarItemContainer class]]) {
        return NSIntegerMax;
    }
    BaseTabbarItemContainer *container = sender;
    NSInteger newIndex = MAX(0, container.tag - 1000);
    newIndex = [self p_validateIndex:newIndex];
    return newIndex;
}

- (NSInteger)p_validateIndex:(NSInteger)index {
    if (index > self.items.count || self.items[index] == nil || self.items[index].isEnabled == false) {
        return NSIntegerMax;
    }
    if (!self.customDelegate || ![self.customDelegate respondsToSelector:@selector(baseTabbar:shouldSelectWithItem:)]) {
        return NSIntegerMax;
    }
    if ([self.customDelegate baseTabbar:self shouldSelectWithItem:self.items[index]] == false) {
        return NSIntegerMax;
    }
    return index;
}

- (void)selectAction:(id)sender {
    if (![sender isKindOfClass:[BaseTabbarItemContainer class]]) {
        return;
    }
    BaseTabbarItemContainer *container = sender;
    [self p_selectWithItemIndex:container.tag - 1000 animated:true];
}

- (void)p_selectWithItemIndex:(NSUInteger)idx animated:(BOOL)animated {
    NSUInteger newIndex = MAX(0, idx);
    NSUInteger currentIndex
    = (self.selectedItem != nil) ? (([self.items indexOfObject:self.selectedItem]) ? NSNotFound : -1) : -1;
    newIndex = [self p_validateIndex:newIndex];
    if (newIndex == NSIntegerMax) {
        return;
    }
    BaseTabbarItem *item = (BaseTabbarItem *)self.items[newIndex];
    
    if ([self.customDelegate respondsToSelector:@selector(baseTabbar:shouldHookWithItem:)]) {
        if ([self.customDelegate baseTabbar:self shouldHookWithItem:item]) {
            [self.customDelegate baseTabbar:self didHookedWithItem:item];
            if (animated == true) {
                [item.contentView selectWithAnimation:true completion:^{
                    [item.contentView deselectWithAnimation:true completion:nil];
                }];
            }
            return;
        }
        return;
    }
    
    if (currentIndex != newIndex) {
        if (currentIndex != -1 && currentIndex < self.items.count) {
            BaseTabbarItem *currentItem = (BaseTabbarItem *)self.items[currentIndex];
            [currentItem.contentView deselectWithAnimation:true completion:nil];
        }
        [item.contentView selectWithAnimation:true completion:nil];
        [self.delegate tabBar:self didSelectItem:item];
    } else if (currentIndex == newIndex) {
        [item.contentView reselectWithAnimation:true completion:nil];
        if (self.tabbarController == nil) {
            return;
        }
    }
}

- (void)updateAccessibilityLabels {
//    [self.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
//        BaseTabbarItemContainer *container = self.containers[idx];
//        NSString *accessibilityTitle = @"";
//
//        if ([item isKindOfClass:[BaseTabbarItem class]]) {
//            NSString *itemTitle = item.title ? item.title : @"";
//            accessibilityTitle = item.accessibilityLabel ? item.accessibilityLabel : itemTitle;
//        }
//    }];
}

@end
