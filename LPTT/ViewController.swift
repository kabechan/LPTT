//
//  ViewController.swift
//  LPTT
//
//  Created by 可部谷崇 on 2017/04/30.
//  Copyright © 2017年 kabetani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var countButton: UIButton!
    
    private let items: NSArray = []
    private var tableView: UITableView!
    
    private var nowTimeLabel: UILabel!
    private var setTimeLabel: UILabel!
    
    private var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //背景を黒色にする
        self.view.backgroundColor = UIColor.black
        
        //countButtonの設定
        countButton = UIButton(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: 70))
        countButton.setTitle("00:00", for: .normal)
        countButton.setTitleColor(UIColor.white, for: .normal)
        countButton.titleLabel?.textAlignment = NSTextAlignment.center
        countButton.titleLabel?.font = UIFont.systemFont(ofSize: 70)
        self.view.addSubview(countButton)
        
        //tableViewの設定
        let barHeight: CGFloat = 90
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height/2.65
        tableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        //nowTimeLabelの設定
        nowTimeLabel = UILabel(frame: CGRect(x: 0, y:self.view.frame.height/2, width: self.view.frame.width/2, height: 50))
        nowTimeLabel.text = "00:00"
        nowTimeLabel.textColor = UIColor.white
        nowTimeLabel.textAlignment = NSTextAlignment.center
        nowTimeLabel.font = UIFont.systemFont(ofSize: 50)
        nowTimeLabel.layer.borderColor = UIColor.white.cgColor
        nowTimeLabel.layer.borderWidth = 1
        nowTimeLabel.backgroundColor = UIColor.black
        self.view.addSubview(nowTimeLabel)
        
        //setTimeLabelの設定
        setTimeLabel = UILabel(frame: CGRect(x: self.view.frame.width/2, y:self.view.frame.height/2, width: self.view.frame.width/2, height: 50))
        setTimeLabel.text = "00:00"
        setTimeLabel.textColor = UIColor.white
        setTimeLabel.textAlignment = NSTextAlignment.center
        setTimeLabel.font = UIFont.systemFont(ofSize: 50)
        setTimeLabel.layer.borderColor = UIColor.white.cgColor
        setTimeLabel.layer.borderWidth = 1
        setTimeLabel.backgroundColor = UIColor.black
        self.view.addSubview(setTimeLabel)
        
        //textViewの設定
        textView = UITextView(frame: CGRect(x: 0, y: self.view.frame.height/1.74, width: self.view.frame.width, height:self.view.frame.height))
        textView.backgroundColor = UIColor.black
        textView.textColor = UIColor.white
        textView.textAlignment = NSTextAlignment.left
        textView.isEditable = false
        self.view.addSubview(textView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Cellが選択された際に呼び出される
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(items[indexPath.row])")
    }
    
    //Cellの総数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    //Cellに値を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        
        // Cellに値を設定する.
        cell.textLabel!.text = "\(items[indexPath.row])"
        
        return cell
    }
}