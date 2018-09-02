//
//  ViewController.swift
//  EasyThemer
//
//  Created by wfltaylor@gmail.com on 08/26/2018.
//  Copyright (c) 2018 wfltaylor@gmail.com. All rights reserved.
//

import UIKit
import EasyThemer
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func lightTheme(_ sender: Any) {
        ThemeEngine.standard.setTheme(theme: LightTheme())
    }
    
    @IBAction func darkTheme(_ sender: Any) {
        ThemeEngine.standard.setTheme(theme: DarkTheme())
    }
    
    @IBAction func crazyTheme(_ sender: Any) {
        ThemeEngine.standard.setTheme(theme: JSONTheme(named: "CrazyTheme")!/*CrazyTheme()*/)
    }
    
}

