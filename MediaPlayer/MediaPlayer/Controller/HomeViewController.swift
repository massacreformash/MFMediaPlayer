//
//  HomeViewController.swift
//  MediaPlayer
//
//  Created by Aaron Peng on 2018/1/2.
//  Copyright © 2018年 BUPT. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        p_initOwnProperties();
    }

    func p_initOwnProperties() -> Void {
        view.backgroundColor = UIColor.white;
    }
}
