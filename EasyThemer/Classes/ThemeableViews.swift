//
//  ThemableViews.swift
//  EasyThemer
//
//  Created by William Taylor on 25/8/18.
//

import UIKit

/**
 A basic themeable UIView
 */
open class ThemeableView: UIView, ThemeEngineDelegate {
    
    /**
     Sets the desired theme
     
     - Parameter theme: The theme to set

     */
    public func set(theme: Theme) {
        self.backgroundColor = theme.backgroundColor
        self.tintColor = theme.tintColor
    }
    
    /**
     Gets the current theme
     
     - Returns: The current theme on the standard ThemeEngine
     
     */
    private func getTheme() -> Theme {
        return ThemeEngine.standard.currentTheme!
    }
    
    public init() {
        super.init(frame: CGRect.zero)
        ThemeEngine.standard.register(self)
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        ThemeEngine.standard.register(self)
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ThemeEngine.standard.register(self)
    }
    public func themeChanged(theme: Theme) {
        set(theme: getTheme())
    }
    public func themeReady(theme: Theme) {
        set(theme: getTheme())
    }
    
}

/**
 A basic themeable UIButton
 */
open class ThemeableButton: UIButton, ThemeEngineDelegate {
    
    /**
     Sets the desired theme
     
     - Parameter theme: The theme to set
     
     */
    public func set(theme: Theme) {
        self.tintColor = theme.tintColor
        self.setTitleColor(theme.primaryColor, for: .normal)
        self.titleLabel?.font = theme.primaryFont?.withSize(self.titleLabel!.font.pointSize)
    }
    
    /**
     Gets the current theme
     
     - Returns: The current theme on the standard ThemeEngine
     
     */
    private func getTheme() -> Theme {
        return ThemeEngine.standard.currentTheme!
    }
    public init() {
        super.init(frame: CGRect.zero)
        ThemeEngine.standard.register(self)
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        ThemeEngine.standard.register(self)
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ThemeEngine.standard.register(self)
    }
    public func themeChanged(theme: Theme) {
        set(theme: getTheme())
    }
    public func themeReady(theme: Theme) {
        set(theme: getTheme())
    }
    
}

/**
 A basic themeable UINavigationBar
 */
open class ThemeableNavigationBar: UINavigationBar, ThemeEngineDelegate {
    
    /**
     Sets the desired theme
     
     - Parameter theme: The theme to set
     
     */
    public func set(theme: Theme) {
        self.tintColor = theme.tintColor
        self.barStyle = theme.barStyle ?? self.barStyle
        if theme.titleFont != nil {
            self.titleTextAttributes = [NSAttributedString.Key.font: theme.titleFont!]
            if #available(iOS 11.0, *) {
                self.largeTitleTextAttributes = [NSAttributedString.Key.font: theme.titleFont!]
            } else {
                print("Failed To Set Large Title Attribute")
            }
        }
        self.barTintColor = theme.barTintColor
        if #available(iOS 11.0, *) {
            self.prefersLargeTitles = true
        } else {
            print("Failed To Set Large Title Attribute")
        }
    }
    
    /**
     Gets the current theme
     
     - Returns: The current theme on the standard ThemeEngine
     
     */
    private func getTheme() -> Theme {
        return ThemeEngine.standard.currentTheme!
    }
   
    public init() {
        super.init(frame: CGRect.zero)
        ThemeEngine.standard.register(self)
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        ThemeEngine.standard.register(self)
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ThemeEngine.standard.register(self)
    }
    public func themeChanged(theme: Theme) {
        set(theme: getTheme())
    }
    public func themeReady(theme: Theme) {
        set(theme: getTheme())
    }
}

/**
 A basic themeable UITabBar
 */
open class ThemeableTabBar: UITabBar, ThemeEngineDelegate {
    
    /**
     Sets the desired theme
     
     - Parameter theme: The theme to set
     
     */
    public func set(theme: Theme) {
        self.tintColor = theme.tintColor
        self.barStyle = theme.barStyle ?? self.barStyle
        self.barTintColor = theme.barTintColor
    }
    
    /**
     Gets the current theme
     
     - Returns: The current theme on the standard ThemeEngine
     
     */
    private func getTheme() -> Theme {
        return ThemeEngine.standard.currentTheme!
    }
    
    public init() {
        super.init(frame: CGRect.zero)
        ThemeEngine.standard.register(self)
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        ThemeEngine.standard.register(self)
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ThemeEngine.standard.register(self)
    }
    public func themeChanged(theme: Theme) {
        set(theme: getTheme())
    }
    public func themeReady(theme: Theme) {
        set(theme: getTheme())
    }
    
}

/**
 A basic themeable UILabel
 */
open class ThemeableLabel: UILabel, ThemeEngineDelegate {

    /**
     Sets the desired theme
     
     - Parameter theme: The theme to set
     
     */
    public func set(theme: Theme) {
        self.tintColor = theme.tintColor
        self.textColor = theme.textColor
        self.font = theme.primaryFont?.withSize(self.font.pointSize)
    }
    
    /**
     Gets the current theme
     
     - Returns: The current theme on the standard ThemeEngine
     
     */
    private func getTheme() -> Theme {
        return ThemeEngine.standard.currentTheme!
    }
    
    public init() {
        super.init(frame: CGRect.zero)
        ThemeEngine.standard.register(self)
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        ThemeEngine.standard.register(self)
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ThemeEngine.standard.register(self)
    }
    public func themeChanged(theme: Theme) {
        set(theme: getTheme())
    }
    public func themeReady(theme: Theme) {
        set(theme: getTheme())
    }
}
