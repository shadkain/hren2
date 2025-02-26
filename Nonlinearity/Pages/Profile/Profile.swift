//
//  Profile.swift
//  Nonlinearity
//
//  Created by Андронов Дмитрий on 20.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class Profile {
    var nickname: String
    var title : String
    var urlAvatar : String
    
    init(nickname: String , title: String, urlAvatar: String)  {
        self.nickname = nickname
        self.title = title
        self.urlAvatar = urlAvatar
    }
}



extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(netHex:Int) {
       self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}



