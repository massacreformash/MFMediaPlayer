//
//  HomeTableView.swift
//  MediaPlayer
//
//  Created by Aaron Peng on 2018/1/6.
//  Copyright © 2018年 BUPT. All rights reserved.
//

import UIKit

class HomeTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    let kHomeTableViewCellID = "kHomeTableViewCellID"
    let kHometableViewOptionNum = 4
    
    var tableViewTitles = ["1", "2", "3", "4"]
    
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        p_initOwnProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kHometableViewOptionNum
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kHomeTableViewCellID, for: indexPath)
        cell.textLabel?.text = tableViewTitles[indexPath.row]
        return cell;
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        MPLog("indexPath: \(indexPath.row)")
    }
    
    // MARK: - init
    private func p_initOwnProperties () -> Void {
        self.backgroundColor = UIColor.gray
        self.delegate = self;
        self.dataSource = self;
        self.register(UITableViewCell.self, forCellReuseIdentifier: kHomeTableViewCellID)
    }
    
}
