//
//  SecondViewController.swift
//  LPTT
//
//  Created by 可部谷崇 on 2017/05/09.
//  Copyright © 2017年 kabetani. All rights reserved.


import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //データを保存する定数:savaDataの作成
    let saveData = UserDefaults.standard
    //多次元配列dataの作成
    var data: [[String]] = []
    
    private var tableView: UITableView!
    
    private var backButton: UIButton!
    private var addButton: UIButton!

    //Viewが初めて呼び出される時に一度だけ
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //背景色を黒にする
        self.view.backgroundColor = UIColor.black
        
        //tableViewの設定
        let barHeight: CGFloat = 90
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height/1.5
        tableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        self.view.addSubview(tableView)
        
        //backButtonの設定
        backButton = UIButton(frame: CGRect(x: self.view.frame.width/4, y: self.view.frame.height/1.15, width: 50, height: 50))
        backButton.backgroundColor = UIColor.darkGray
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        backButton.setTitle("←", for: .normal)
        backButton.addTarget(self, action: #selector(SecondViewController.onClickBackButton(sender:)), for: .touchUpInside)
        self.view.addSubview(backButton)
        
        //addButtonの設定
        addButton = UIButton(frame: CGRect(x: self.view.frame.width/1.6, y: self.view.frame.height/1.15, width: 50, height: 50))
        addButton.backgroundColor = UIColor.darkGray
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        addButton.setTitle("+", for: .normal)
        addButton.addTarget(self, action: #selector(SecondViewController.onClickAddButton(sender:)), for: .touchUpInside)
        self.view.addSubview(addButton)
    }
    
    //画面が表示される直前
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //UserDefaultsの情報をdataに追加
        if saveData.array(forKey: "dataKey") != nil{
            data = saveData.array(forKey: "dataKey") as! [[String]]
        }
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //tableViewの設定
    //cellが選択された際に呼び出される
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*//遷移するViewの定義
        let myThirdViewController: UIViewController = ThirdViewController()
        //アニメーションを設定
        myThirdViewController.modalTransitionStyle = .crossDissolve
        //Viewの移動
        self.present(myThirdViewController, animated:  true, completion: nil)*/
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
        return data.count
    }
    //適当なcellの高さを指定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    //cellの上部のスペースの幅を指定
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TableViewCell
        //dataの値が10未満なら二桁目に0を付け加える
        if Int(data[indexPath.section][2])! < 10{
            data[indexPath.section][2] = "0" + data[indexPath.section][2]
        }
        if Int(data[indexPath.section][3])! < 10{
            data[indexPath.section][3] = "0" + data[indexPath.section][3]
        }
        //customCellのLabelにデータを取得
        cell.setCell(titleText: data[indexPath.section][1], minText: data[indexPath.section][2], secText: data[indexPath.section][3])
        
        //cellのハイライト機能を削除
        cell.selectionStyle = UITableViewCellSelectionStyle.none

        return cell
    }

    //onClickBackButtonの設定
    internal func onClickBackButton(sender: UIButton){
        //遷移するViewの定義
        let myFirstViewController: UIViewController = ViewController()
        //アニメーションを設定
        myFirstViewController.modalTransitionStyle = .crossDissolve
        //Viewの移動
        self.present(myFirstViewController, animated: true, completion: nil)
    }
    
    //onClickAddButtonの設定
    internal func onClickAddButton(sender: UIButton){
        //遷移するViewの定義
        let myThirdViewController: UIViewController = ThirdViewController()
        //アニメーションを設定
        myThirdViewController.modalTransitionStyle = .crossDissolve
        //Viewの移動
        self.present(myThirdViewController, animated:  true, completion: nil)
    }
}
