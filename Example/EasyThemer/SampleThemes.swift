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
        titleFont = UIFont(name: "Gill Sans", size: 20)
        primaryFont = UIFont(name: "Gill Sans", size: 12)
        backgroundColor = UIColor.white
        prefersLargeTitles = true
    }
}
class DarkTheme: ThemeDecleration {
    override func setupProperties() {
        backgroundColor = UIColor.black
        textColor = UIColor.white
        barStyle = UIBarStyle.black
        //titleFont = UIFont(name: "Gill Sans", size: 20)
        //primaryFont = UIFont(name: "Gill Sans Light", size: 12)
        prefersLargeTitles = true
    }
}
