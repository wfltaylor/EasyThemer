//
//  ThemeableItems.swift
//  EasyThemer
//
//  Created by William Taylor on 08/25/2018.
//  Copyright (c) 2018 William Taylor. All rights reserved.
//

/**
 The base theme protocol
 
 All themes must conform to this protocol
 */
public protocol Theme {
    //Standard Colors
    var backgroundColor: UIColor? { get }
    var textColor: UIColor? { get }
    var primaryColor: UIColor? { get }
    var tintColor: UIColor? { get }
    //Standard Fonts
    var primaryFont: UIFont? { get }
    var titleFont: UIFont? { get }
    //Other
    var barStyle: UIBarStyle? { get }
    var barTintColor: UIColor? { get }
    var prefersLargeTitles: Bool? { get }
}

/**
 This class can be overriden for a more convenient way to declare a theme
 */
open class ThemeDeclaration: Theme {
    
    public var barTintColor: UIColor?

    public var backgroundColor: UIColor?
    
    public var textColor: UIColor?
    
    public var primaryColor: UIColor?
    
    public var tintColor: UIColor?
    
    public var primaryFont: UIFont?
    
    public var titleFont: UIFont?
    
    public var barStyle: UIBarStyle?
    
    public var prefersLargeTitles: Bool?
    
    open func setupProperties() {}
    
    public required init() {
        setupProperties()
    }
    
}
