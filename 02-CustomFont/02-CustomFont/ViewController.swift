//
//  ViewController.swift
//  02-CustomFont
//  自定义字体的转换
//  Created by WindTalker on 2017/8/10.
//  Copyright © 2017年 WindTalker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉",
                "测试测试测试测试测试测试",
                "123",
                "Alex",
                "感谢allenwong/30DaysofSwift",
                "原作地址:",
                "https://github.com/allenwong/30DaysofSwift"]
    
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "edundot", "Gaspar Regular"]
    
    var fontRowIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontTableView.dataSource = self
        fontTableView.delegate = self
        
        for family in UIFont.familyNames {
            for font in UIFont.fontNames(forFamilyName: family){
                print(font)
            }
        }
        
        changeFontButton.layer.cornerRadius = 55
    }

    @IBOutlet weak var changeFontButton: UIButton!
    
    @IBOutlet weak var fontTableView: UITableView!
    
    @IBAction func changeFontDidTouch(_ sender: UIButton) {
        
        fontRowIndex = (fontRowIndex + 1) % 5
        print(fontNames[fontRowIndex])
        fontTableView.reloadData()
    }
    
    //MARK:UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = fontTableView.dequeueReusableCell(withIdentifier: "FontCell", for: indexPath)
        
        let text = data[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.font = UIFont(name:self.fontNames[fontRowIndex], size:16)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

