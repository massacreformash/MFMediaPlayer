//
//  HomeViewController.swift
//  MediaPlayer
//
//  Created by Aaron Peng on 2018/1/2.
//  Copyright © 2018年 BUPT. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: BaseViewController {

    lazy var homeTableView: HomeTableView = {
        let tableView = HomeTableView.init(frame: CGRect.zero, style: UITableViewStyle.plain)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        p_initOwnProperties();
        p_setupUI()
    }
    
    // MARK: - handle views
    private func p_setupUI () -> Void {
        view.addSubview(homeTableView)
        
        p_setupLayout()
    }
    
    private func p_setupLayout () -> Void {
        homeTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaInsets.top)
            make.right.left.equalTo(view)
            make.bottom.equalTo(view);
        }
    }
    
    // MARK: - init
    func p_initOwnProperties() -> Void {
        view.backgroundColor = UIColor.white;
    }
    
    
}
