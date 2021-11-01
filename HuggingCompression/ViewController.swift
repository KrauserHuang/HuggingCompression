//
//  ViewController.swift
//  HuggingCompression
//
//  Created by Tai Chin Huang on 2021/11/1.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let yellowLabel: UILabel = {
        let label = UILabel()
        label.text = "我是黄色Label,我是黄色Label,我是黄色Label,我是黄色Label"
        label.backgroundColor = .yellow
        return label
    }()
    
    let blueLabel: UILabel = {
        let label = UILabel()
        label.text = "我是蓝色Label"
        label.backgroundColor = .blue
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createScene()
    }
    
    func createScene() {
        view.addSubview(yellowLabel)
        view.addSubview(blueLabel)
        
//        yellowLabel.snp.makeConstraints { make in
//            make.center.equalTo(self.view)
//            // 左右限制的優先級會比固定內容(label.text)的優先級高
//            // 所謂的壓縮是指，左右約束+label.text寬度 > 螢幕寬度，所以只能藉由壓縮label.text
////            make.left.equalTo(self.view).offset(100)
////            make.right.equalTo(self.view).offset(-100)
//            // 因為降低了左右約束的優先級，所以改變成先顯示label.text內容再滿足左右約束
//            // 感覺上就是label的抗壓性增加
//            make.left.equalTo(self.view).offset(100).priority(250)
//            make.right.equalTo(self.view).offset(-100).priority(250)
//        }
        
        blueLabel.snp.makeConstraints { make in
            make.center.equalTo(self.view)
            // 所謂的拉升是指，左右約束+label.text寬度 < 螢幕寬度，為了滿足左右約束只能拉伸label.text
            make.left.equalTo(self.view).offset(100)
            make.right.equalTo(self.view).offset(-100)
            // 因為降低左右約束的優先級，原本沒塞滿的label先滿足，而左右約束在成立
            // 也就是讓label的抗拉伸提高
            make.left.equalTo(self.view).offset(100).priority(250)
            make.right.equalTo(self.view).offset(-100).priority(250)
        }
    }
}

