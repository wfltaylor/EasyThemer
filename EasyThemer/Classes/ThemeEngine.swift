//
//  ThemeInstance.swift
//  EasyThemer
//
//  Created by William Taylor on 25/8/18.
//

import Foundation

public class ThemeEngine {
    
    public static let standard = ThemeEngine(defaultTheme: nil)
    public private(set) var currentTheme: Theme?
    public var defaultTheme: Theme! {
        didSet {
            isReady = true
            for client in clients {
                client.themeReady?()
            }
        }
    }
    
    public var isReady = false
    
    public var clients = [ThemeEngineDelegate]()
    
    public init(defaultTheme: Theme?) {
        self.defaultTheme = defaultTheme

    }
    
    public func setTheme(theme: Theme) {
        if defaultTheme == nil {
            print("Unable to set theme as ThemeEngine has not been configured")
            return
        }
        currentTheme = theme
        for client in clients {
            client.themeChanged()
        }
    }
    public func configure(theme: Theme) {
        currentTheme = theme
        defaultTheme = theme
        

    }
    
}

@objc public protocol ThemeEngineDelegate {
    func themeChanged()
    @objc optional func themeReady()
}

