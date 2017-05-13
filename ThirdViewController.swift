//
//  ThirdViewController.swift
//  LPTT
//
//  Created by 可部谷崇 on 2017/05/09.
//  Copyright © 2017年 kabetani. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private var textField: UITextField!
    
    private var pickerView: UIPickerView!
    private let minList:NSArray = ([Int](0...60) as NSArray)
    private var secList:NSArray = ([Int](0...60) as NSArray)
    
    private var textView: UITextView!
    
    private var backButton: UIButton!
    private var checkButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //背景色を黒にする
        self.view.backgroundColor = UIColor.black
        
        //textFieldの設定
        textField = UITextField(frame: CGRect(x: self.view.frame.width/7, y: 20, width: self.view.frame.width/1.4, height: 50))
        textField.backgroundColor = UIColor.white
        textField.placeholder = "タイトル"
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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
            return String(describing: minList[row])
        }
        return String(describing: secList[row])
    }
    //選択時の処理設定
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            print(minList[row])
        }
        print(secList[row])
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
