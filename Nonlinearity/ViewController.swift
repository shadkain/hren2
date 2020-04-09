//
//  ViewController.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 01/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit
import PinLayout

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .hex(rgb: 0x252525)
        
/*StoryCargdView setup*/
//        let sv = StoryCardView(frame: .zero)
//
//        sv.image = UIImage(named: "book")
//        sv.nameLable.text = "Захватывающий дух"
//
//        view.addSubview(sv)
//
//        sv.pin
//            .top(100)
//            .horizontally(150)
//            .aspectRatio(0.6)
        
/*BubbleView setup*/
        let bv = BubbleView(frame: .zero)
        
        bv.image = UIImage(named: "drama-face")
        bv.titleLable.text = "Драма"
        
        view.addSubview(bv)
        
        bv.pin.top(100).hCenter()
    }


}

