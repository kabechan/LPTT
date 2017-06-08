//
//  TableViewCell.swift
//  LPTT
//
//  Created by 可部谷崇 on 2017/05/08.
//  Copyright © 2017年 kabetani. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var min: UILabel!
    @IBOutlet var sec: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //タイトル・時間を設定するメソッド
    func setCell(titleText: String, minText: String, secText: String) {
        title.text = titleText
        min.text = minText
        sec.text = secText
    }
}
