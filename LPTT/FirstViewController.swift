//
//  ViewController.swift
//  LPTT
//
//  Created by 可部谷崇 on 2017/04/30.
//  Copyright © 2017年 kabetani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //データを保存する定数:savaDataの作成
    let saveData = UserDefaults.standard
    //多次元配列dataの作成
    var data: [[String]] = []
    var tag = -2
    
    var count = 0
    var minCount = 0
    var secCount = 0
    
    var timer: Timer!
    var min = 0
    var sec = 0
    
    private var countButton: UIButton!
    var timerRunning = true
    
    private var setButton: UIButton!
    
    private var tableView: UITableView!
    var choice: IndexPath! = nil
    //var auto: IndexPath! = nil
    
    private var nowTimeLabel: UILabel!
    private var setTimeLabel: UILabel!
    
    private var textView: UITextView!

    //Viewが初めて呼び出される時に一度だけ
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
        countButton.addTarget(self, action: #selector(ViewController.onClickCountButton), for: .touchUpInside)
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
        tableView.separatorColor = UIColor.clear
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
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
        textView.font = UIFont.systemFont(ofSize: 25)
        textView.layer.borderWidth = 2
        textView.layer.borderColor = UIColor.white.cgColor
        textView.isEditable = false
        self.view.addSubview(textView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //画面が表示される直前
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //UserDefaultsの情報をdataに追加
        if saveData.array(forKey: "dataKey") != nil{
            data = saveData.array(forKey: "dataKey") as! [[String]]
        }
        //全体時間の合計値
        for i in 0..<data.count {
            minCount = minCount + Int(data[i][2])!
        }
        for i in 0..<data.count {
            secCount = secCount + Int(data[i][3])!
        }
        if secCount >= 60 {
            minCount = minCount + (secCount / 60)
            secCount = (secCount % 60)
        }
        //dataの値が10未満なら二桁目に0を付け加える
        for i in 0..<data.count {
            if Int(data[i][2])! < 10 {
                data[i][2] = "0" + data[i][2]
            }
        }
        for i in 0..<data.count {
            if Int(data[i][3])! < 10 {
                data[i][3] = "0" + data[i][3]
            }
        }
    }
    
    //画面が表示された直後
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //全体時間の表示処理
        if minCount < 10 && secCount < 10 {
            countButton.setTitle("0" + String(minCount) + ":0" + String(secCount), for: .normal)
        }else if minCount < 10{
            countButton.setTitle("0" + String(minCount) + ":" + String(secCount), for: .normal)
        }else if secCount < 10{
            countButton.setTitle(String(minCount) + ":0" + String(secCount), for: .normal)
        }else{
            countButton.setTitle(String(minCount) + ":" + String(secCount), for: .normal)
        }
        //timerの生成 func update(tm: Timer)を１秒間隔で呼び出す
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    //別の画面に遷移する直前
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        //タイマーの停止
        timer.invalidate()
    }
    
    
    func update(tm: Timer) {
        print(min)
        print(sec)
        
        if 0 <= tag && tag < data.count {
        setTimeLabel.text = data[tag][2] + ":" + data[tag][3]
        textView.text = data[tag][4]
        }
        //nowTimeLabelの表示とカウントダウン処理
        if min < 10 && sec < 10 {
            nowTimeLabel.text = "0" + String(min) + ":0" + String(sec)
        }else if min < 10 {
            nowTimeLabel.text = "0" + String(min) + ":" + String(sec)
        }else if sec < 10 {
            nowTimeLabel.text = String(min) + ":0" + String(sec)
        }else{
            nowTimeLabel.text = String(min) + ":" + String(sec)
        }
        if min == 0 && sec == 0 {
            tag += 1
            if tag == -1 || tag == data.count {
                timer.invalidate()
            }else{
                min = Int(data[tag][2])!
                sec = Int(data[tag][3])! + 1
                
                tableView.deselectRow(at: choice, animated: true)
                //セルを選択状態にして一番上にスクロールさせる
                //tableView.selectRow(at: choice, animated: true, scrollPosition: .top)
                //tableView.moveRow(at: choice, to: auto)
            }
        }
        if sec == 0{
            min -= 1
            sec = 60
        }
        if min == 0 && sec == 0 {
            timer.fire()
        }
        sec -= 1
    }
    
    //countButtonの処理
    internal func onClickCountButton(sender: UIButton) {
        if timerRunning == true{
            timer.invalidate()
            timerRunning = false
        }else{
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
            RunLoop.current.add(timer, forMode: RunLoopMode.commonModes)
            timerRunning = true
        }
    }
    
    //setButtonの処理
    internal func onClickSetButton(sender: UIButton) {
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
        timerRunning = true
        tag = Int(data[indexPath.section][0])!
        //タイマーの停止
        timer.invalidate()
        min = Int(data[indexPath.section][2])!
        sec = Int(data[indexPath.section][3])!
        //timerの生成 func update(tm: Timer)を１秒間隔で呼び出す
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        //任意のタイミングでタイマーに登録したターゲットのメソッドを呼ぶ
        timer.fire()
        
        //setTimeLabelとtextViewの表示の切り替え
        if setTimeLabel.text != "" && textView.text != "" {
            setTimeLabel.text = ""
            textView.text = ""
        }
        setTimeLabel.text = data[indexPath.section][2] + ":" + data[indexPath.section][3]
        textView.text = data[indexPath.section][4]
        
        choice = IndexPath (row: indexPath.row, section: indexPath.section)
        //auto = IndexPath (row: (indexPath.row + 1), section: (indexPath.section + 1))
        //セルを選択状態にして一番上にスクロールさせる
        tableView.selectRow(at: choice, animated: true, scrollPosition: .top)
    }
    //cellをハイライトできるか指定
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        //編集を可能にする
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TableViewCell
        //customCellのLabelにデータを取得
        cell.setCell(titleText: data[indexPath.section][1], minText: data[indexPath.section][2], secText: data[indexPath.section][3])
        print(data)
        
        //cellのハイライト機能を削除
        //cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
        }
}
