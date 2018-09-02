//
//  SampleThemes.swift
//  EasyThemer_Example
//
//  Created by William Taylor on 1/9/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import EasyThemer

class LightTheme: ThemeDecleration {
    override func setupProperties() {
        titleFont = UIFont(name: "Gill Sans", size: 44)
        primaryFont = UIFont(name: "Gill Sans", size: 12)
        backgroundColor = UIColor.white
        prefersLargeTitles = true
        barStyle = UIBarStyle.default
    }
}
class DarkTheme: ThemeDecleration {
    override func setupProperties() {
        titleFont = UIFont.systemFont(ofSize: 44)
        primaryFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        backgroundColor = UIColor.black
        textColor = UIColor.white
        barStyle = UIBarStyle.black
        prefersLargeTitles = true
    }
}
