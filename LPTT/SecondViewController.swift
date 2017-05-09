//
//  SecondViewController.swift
//  LPTT
//
//  Created by 可部谷崇 on 2017/05/09.
//  Copyright © 2017年 kabetani. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    private var addButton: UIButton!
    private var backButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //背景色を黒にする
        self.view.backgroundColor = UIColor.black
        
        //backButtonの設定
        backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        backButton.backgroundColor = UIColor.darkGray
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        backButton.setTitle("←", for: .normal)
        backButton.addTarget(self, action: #selector(SecondViewController.onClickBackButton(sender:)), for: .touchUpInside)
        self.view.addSubview(backButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //backButtonの設定
    internal func onClickBackButton(sender: UIButton){
        //遷移するViewの定義
        let myFirstViewController: UIViewController = ViewController()
        
        //アニメーションを設定
        myFirstViewController.modalTransitionStyle = .crossDissolve
        
        //Viewの移動
        self.present(myFirstViewController, animated: true, completion: nil)
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
