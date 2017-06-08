//
//  ThirdViewController.swift
//  LPTT
//
//  Created by 可部谷崇 on 2017/05/09.
//  Copyright © 2017年 kabetani. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //データを保存する定数:savaDataの作成
    let saveData = UserDefaults.standard
    //多次元配列dataの作成
    var data: [[String]] = []
    var count = 0

    var textField: UITextField!
    
    private var pickerView: UIPickerView!
    private let minList:NSArray = ([Int](0...60) as NSArray)
    private let secList:NSArray = ([Int](0...59) as NSArray)
    var min = 0
    var sec = 0
    
    private var textView: UITextView!
    
    private var backButton: UIButton!
    private var checkButton: UIButton!

    //Viewが初めて呼び出される時に一度だけ
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //背景色を黒にする
        self.view.backgroundColor = UIColor.black
        
        //textFieldの設定
        textField = UITextField(frame: CGRect(x: self.view.frame.width/7, y: 20, width: self.view.frame.width/1.4, height: 50))
        textField.backgroundColor = UIColor.white
        textField.placeholder = "台本(カンペ)タイトル"
        textField.textColor = UIColor.black
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 20
        self.view.addSubview(textField)
        
        //pickerViewの設
        pickerView = UIPickerView(frame: CGRect(x: 0, y: self.view.frame.height/8, width: self.view.frame.width, height: 130))
        pickerView.backgroundColor = UIColor.white
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectedRow(inComponent: 0)
        pickerView.selectedRow(inComponent: 1)
        pickerView.layer.borderWidth = 2
        pickerView.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(pickerView)
        
        //textViewの設定
        textView = UITextView(frame: CGRect(x: 0, y: self.view.frame.height/3, width: self.view.frame.width, height:self.view.frame.height/2))
        textView.backgroundColor = UIColor.white
        textView.textColor = UIColor.black
        textView.textAlignment = NSTextAlignment.left
        textView.layer.borderWidth = 2
        textView.layer.borderColor = UIColor.black.cgColor
        textView.isEditable = true
        self.view.addSubview(textView)
        
        //backButtonの設定
        backButton = UIButton(frame: CGRect(x: self.view.frame.width/4, y: self.view.frame.height/1.15, width: 50, height: 50))
        backButton.backgroundColor = UIColor.darkGray
        backButton.setTitle("←", for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        backButton.addTarget(self, action: #selector(ThirdViewController.onClickBackButton(sender:)), for: .touchUpInside)
        self.view.addSubview(backButton)
        
        //checkButtonの設定
        checkButton = UIButton(frame: CGRect(x: self.view.frame.width/1.6, y: self.view.frame.height/1.15, width: 50, height: 50))
        checkButton.backgroundColor = UIColor.darkGray
        checkButton.setTitle("✔︎", for: .normal)
        checkButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        checkButton.addTarget(self, action: #selector(ThirdViewController.onClickCheckButton(sender:)), for: .touchUpInside)
        self.view.addSubview(checkButton)
        
        //saveDataに保存したデータのdataへの呼び出し
        if saveData.array(forKey: "dataKey") != nil{
            data = saveData.array(forKey: "dataKey") as! [[String]]
        }
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //画面が表示された直後
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        for i in 0..<data.count{
            count = Int(data[i][0])! + 1
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // ユーザがキーボード以外の場所をタップすると、キーボードを閉じる
        self.view.endEditing(true)
    }
    
    /*func textFieldShouldReturn(_ textField: UITextField) -> Bool{
     // キーボードを閉じる
     textField.resignFirstResponder()
     //UIApplication.shared.keyWindow?.endEditing(true)
     //UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
     return true
     }*/
    
    //表示する列数の設定
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    //表示個数の設定
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return minList.count
        }
        return secList.count
    }
    //選択肢に何を表示するか設定
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return String(describing: minList[row]) + "分"
        }
        return String(describing: secList[row]) + "秒"
    }
    //選択時の処理設定
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            print(minList[row])
            min = minList[row] as! Int
        }else if component == 1{
            print(secList[row])
            sec = secList[row] as! Int
        }
    }
    
    //onClickBackButtonの設定
    internal func onClickBackButton(sender: UIButton){
        //遷移するViewの定義
        let mySecondViewController: UIViewController = SecondViewController()
        //アニメーションを設定
        mySecondViewController.modalTransitionStyle = .crossDissolve
        //Viewの移動
        self.present(mySecondViewController, animated: true, completion: nil)
    }
    
    //onClickCheckButtonの設定
    internal func onClickCheckButton(sender: UIButton){
        //遷移するViewの定義
        let mySecondViewController: UIViewController = SecondViewController()
        //アニメーションを設定
        mySecondViewController.modalTransitionStyle = .crossDissolve
        //Viewの移動
        self.present(mySecondViewController, animated: true, completion: nil)
        
        //var items = [String(textField.text!), String(min), String(sec), String(textView.text!)]
        
        //配列itemsの作成
        var items = [String]()
        //String型の数字に変換してitemsに追加
        items.append(String(count))
        //textField.textの文字列をitemsに追加
        items.append(textField.text!)
        //String型の数字に変換してitemsに追加
        items.append(String(min))
        items.append(String(sec))
        //textView.textの文字列をitemsに追加
        items.append(textView.text)
        
        //data = items as! [[String]]
        //data = [items as! Array<String>]
        
        //もしitems.countの値が５ならitemsの配列をdataの多次元配列に追加
        if items.count == 5{
            data.append(items)
        }
        //saveDataに多次元配列のdataを保存　呼び出し鍵はdataKey
        saveData.set(data, forKey: "dataKey")
        saveData.synchronize()
        
        //data = saveData.object(forKey: "dataKey") as! [[String]]
        
        print(data)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
