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
    private var setButton: UIButton!
    
    private var tableView: UITableView!
    private let items: NSArray = [0, 1, 2, 3, 4, 5, 6]
    
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
        
        //setButtonの設定
        setButton = UIButton(frame: CGRect(x: self.view.frame.width/1.2, y: 35, width: 40, height: 40))
        setButton.setImage(UIImage(named: "set.jpg"), for: .normal)
        setButton.addTarget(self, action: #selector(ViewController.onClickSetButton(sender:)), for: .touchUpInside)
        self.view.addSubview(setButton)
        
        //tableViewの設定
        let barHeight: CGFloat = 90
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height/2.65
        tableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight))
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
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
        textView.layer.borderWidth = 2
        textView.layer.borderColor = UIColor.white.cgColor
        textView.isEditable = false
        self.view.addSubview(textView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //setButtonの処理
    internal func onClickSetButton(sender: UIButton){
        //遷移するViewの定義
        let mySecondViewController: UIViewController = SecondViewController()
        
        //アニメーションを設定
        mySecondViewController.modalTransitionStyle = .crossDissolve
        
        //Viewの移動
        self.present(mySecondViewController, animated: true, completion: nil)
    }
    
    //tableViewの設定
    //cellが選択された際に呼び出される
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    //cellをハイライトできるか指定
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //cellの総数を返す
    //ここで表示したいセルの数を返すが、セクションのヘッダーとフッターでスペーシングしているので、固定で1を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    //ここで表示したいcellの数
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    //適当なcellの高さを指定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    //cellの上部のスペースの幅を指定
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    //cellの下部のスペースの幅を指定
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    //cellの上部のスペースを透明に設定
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.clear
    }
    //cellの下部のスペースを透明に設定
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.clear
    }
    //cellに値を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用するcellを取得する.
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath as IndexPath)
        
        //cellに値を設定する.
        //cell.textLabel!.text = "\(items[indexPath.row])"
        
        return cell
    }
}
