//
//  SecondViewController.swift
//  LPTT
//
//  Created by 可部谷崇 on 2017/05/09.
//  Copyright © 2017年 kabetani. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    private var backButton: UIButton!
    private var addButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //背景色を黒にする
        self.view.backgroundColor = UIColor.black
        
        //backButtonの設定
        backButton = UIButton(frame: CGRect(x: self.view.frame.width/4, y: self.view.frame.height/1.2, width: 50, height: 50))
        backButton.backgroundColor = UIColor.darkGray
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        backButton.setTitle("←", for: .normal)
        backButton.addTarget(self, action: #selector(SecondViewController.onClickBackButton(sender:)), for: .touchUpInside)
        self.view.addSubview(backButton)
        
        //addButtonの設定
        addButton = UIButton(frame: CGRect(x: self.view.frame.width/1.6, y: self.view.frame.height/1.2, width: 50, height: 50))
        addButton.backgroundColor = UIColor.darkGray
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        addButton.setTitle("+", for: .normal)
        addButton.addTarget(self, action: #selector(SecondViewController.onClickAddButton(sender:)), for: .touchUpInside)
        self.view.addSubview(addButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
