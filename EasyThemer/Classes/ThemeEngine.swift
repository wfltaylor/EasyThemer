//
//  ThemeInstance.swift
//  EasyThemer
//
//  Created by William Taylor on 25/8/18.
//

import Foundation

/**
 The class that controls the themes in the app
 */
public class ThemeEngine {
    
    /**
     The standard ThemeEngine. If you use this, it should be configured in the AppDelegate didFinishLaunchingWithOptions
     */
    public static let standard = ThemeEngine(defaultTheme: nil)
    
    /**
     The current theme
     */
    public private(set) var currentTheme: Theme?
    
    /**
     The default theme
     */
    public var defaultTheme: Theme! {
        didSet {
            isReady = true
            for client in clients {
                client.themeReady(theme: defaultTheme)
            }
        }
    }
    
    /**
     Whether the ThemeEngine has been configured
     */
    public var isReady = false
    
    /**
     Weak array of clients
     */
    var clients = PointerArray<ThemeEngineDelegate>(type: .weak)
    
    /**
     Initialize the ThemeEngine with a default theme. The ThemeEngine should be configured after this.
     */
    public init(defaultTheme: Theme?) {
        self.defaultTheme = defaultTheme
        clients.valueAdded = alertClient
    }
    
    /**
     Sets the current theme
     
     - Parameter theme: The theme to set
     
     */
    public func setTheme(theme: Theme) {
        if defaultTheme == nil {
            print("Unable to set theme as ThemeEngine has not been configured")
            return
        }
        currentTheme = theme
        for client in clients {
            client.themeChanged(theme: currentTheme!)
        }
    }
    
    /**
     Makes the ets the currentTheme and the defaultTheme
     
     - Parameter theme: The theme to make the default
     
     */
    public func configure(theme: Theme) {
        currentTheme = theme
        defaultTheme = theme

    }
    
    /**
     Registers a client to be notified of any theme updates
     
     - Parameter client: The client to be notified
     
     */
    public func register(_ client: ThemeEngineDelegate) {
        clients.append(client)
    }
    
    /**
     Alert a client that the theme is ready if it is ready
     
     - Parameter client: The client to be notified
     
     */
    func alertClient(client: ThemeEngineDelegate) {
        if isReady {
            client.themeReady(theme: currentTheme!)
        }
    }
    
}

/**
 The protocol that allows for notifications when a theme is changed
 */
public protocol ThemeEngineDelegate {
    
    /**
     This is called when the theme has been changed
     
     - Parameter theme: The new theme
     
     */
    func themeChanged(theme: Theme)
    
    /**
     This is called when the theme is ready to be applied. This is called when the theme is ready or, if the theme is already ready, when the client is registered to the ThemeEngine.
     
     - Parameter theme: The new theme
     
     */
    func themeReady(theme: Theme)
}
