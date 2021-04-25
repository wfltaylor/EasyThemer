//
//  JSONTheme.swift
//  EasyThemer
//
//  Created by William Taylor on 2/9/18.
//

import Foundation
import UIKit

/*public class DebugGenerator {
    public static func generateJSON() {
        let themeGen = JSONTheme(backgroundColorCode: UIColorCodable(color: UIColor.white), textColorCode: UIColorCodable(color: UIColor.black), primaryColorCode: UIColorCodable(color: UIColor.red), tintColorCode: UIColorCodable(color: UIColor.red), barTintColorCode: UIColorCodable(color: UIColor.gray), primaryFontCode: UIFontCodable(font: UIFont.systemFont(ofSize: 12)), titleFontCode: UIFontCodable(font: UIFont(name: "Gill Sans", size: 54)!), barStyle: UIBarStyle.black, prefersLargeTitles: true)
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let jsonString = try! encoder.encode(themeGen)
        let output = String(data: jsonString, encoding: .utf8)
        print(output!)
    }
}*/

/**
 A struct that allows themes to be desterilised from JSON
 */
public struct JSONTheme: Theme, Codable {
    
    public var primaryFont: UIFont? {
        get {
            return primaryFontCode?.value
        }
    }
    
    public var titleFont: UIFont? {
        get {
            return titleFontCode?.value
        }
    }
    
    public var backgroundColor: UIColor? {
        get {
            return backgroundColorCode
        }
    }
    
    public var textColor: UIColor? {
        get {
            return textColorCode
        }
    }
    
    public var primaryColor: UIColor? {
        get {
            return primaryColorCode
        }
    }
    
    public var tintColor: UIColor? {
        get {
            return tintColorCode
        }
    }
    
    public var barTintColor: UIColor? {
        get {
            return barTintColorCode
        }
    }
    
    let backgroundColorCode: UIColorCodable?
    
    let textColorCode: UIColorCodable?
    
    let primaryColorCode: UIColorCodable?
    
    let tintColorCode: UIColorCodable?
    
    let barTintColorCode: UIColorCodable?
    
    let primaryFontCode: UIFontCodable?
    
    let titleFontCode: UIFontCodable?
    
    public let barStyle: UIBarStyle?
    
    public let prefersLargeTitles: Bool?
    
    /**
    The coding keys to comply with Codeable
     */
    private enum CodingKeys: String, CodingKey {
        case backgroundColorCode
        case textColorCode
        case primaryColorCode
        case tintColorCode
        case primaryFontCode
        case titleFontCode
        case barStyle
        case barTintColorCode
        case prefersLargeTitles
    }
    
    /**
     Creates a theme with a JSON string
     
     - Parameter json: The raw JSON string
     
     */
    public init?(withJson json: String) {
        //Parsing JSON
        let jsonDecoder = JSONDecoder()
        do {
            let theme = try jsonDecoder.decode(JSONTheme.self, from: json.data(using: .utf8)!)
            self = theme
        } catch {
            return nil
        }
    }
    
    /**
     Creates a theme with a JSON file in the documents directory
     
     - Parameter file: The file name with extension
     
     */
    public init?(file: String) {
        //Reading File
        let fileLocation = file
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(fileLocation)
            do {
                let jsonText = try String(contentsOf: fileURL, encoding: .utf8)
                //Parsing JSON
                let jsonDecoder = JSONDecoder()
                let theme = try jsonDecoder.decode(JSONTheme.self, from: jsonText.data(using: .utf8)!)
                self = theme
            }
            catch {
                return nil
            }
        } else {
            return nil
        }
    }
    
    /**
     Creates a theme with a JSON file in the application bundle
     
     - Parameter named: The file name with an extension of type .json without the extension
     
     */
    public init?(named: String) {
        //Reading File
        let fileLocation = named
        
        if let fileURL = Bundle.main.path(forResource: fileLocation, ofType: "json") {
            do {
                let jsonText = try String(contentsOfFile: fileURL)
                
                //Parsing JSON
                let jsonDecoder = JSONDecoder()
                let theme = try jsonDecoder.decode(JSONTheme.self, from: jsonText.data(using: .utf8)!)
                self = theme
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
}

//Codable UIBarStyle
extension UIBarStyle: Codable {
    public init(from decoder: Decoder) throws {
        self.init(rawValue: 0)!
        let value = try decoder.singleValueContainer()
        let type: String = try value.decode(String.self)
        if type == "default" {
            self = UIBarStyle.default
        } else if type == "black" {
            self = UIBarStyle.black
        }
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        if self == UIBarStyle.black {
            try container.encode("black")
        } else if self == UIBarStyle.default {
            try container.encode("default")
        }
    }

}

//Codable UIColor
class UIColorCodable: UIColor, Decodable {
    public required convenience init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: UIColorCodingKeys.self)
        let red: CGFloat = try values.decode(CGFloat.self, forKey: .red)
        let green: CGFloat = try values.decode(CGFloat.self, forKey: .green)
        let blue: CGFloat = try values.decode(CGFloat.self, forKey: .blue)
        let alpha: CGFloat = try values.decode(CGFloat.self, forKey: .alpha)
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    public convenience init(color: UIColor) {
        self.init(red: color.rgba.red, green: color.rgba.green, blue: color.rgba.blue, alpha: color.rgba.alpha)
    }
}
extension UIColor: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: UIColorCodingKeys.self)
        try container.encode(self.rgba.red, forKey: .red)
        try container.encode(self.rgba.green, forKey: .green)
        try container.encode(self.rgba.blue, forKey: .blue)
        try container.encode(self.rgba.alpha, forKey: .alpha)
    }
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red, green, blue, alpha)
    }
}
enum UIColorCodingKeys: String, CodingKey {
    case red
    case green
    case blue
    case alpha
}

//Codable UIFont
class UIFontCodable: Codable {
    let value: UIFont
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: UIFontCodingKeys.self)
        let pointSize: CGFloat = try values.decode(CGFloat.self, forKey: .pointSize)
        let name: String = try values.decode(String.self, forKey: .name)
        value = UIFont(name: name, size: pointSize)!
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: UIFontCodingKeys.self)
        try container.encode(self.value.pointSize, forKey: .pointSize)
        try container.encode(self.value.fontName, forKey: .name)
    }
    public init(font: UIFont) {
        value = UIFont(name: font.fontName, size: font.pointSize)!
    }
}
extension UIFont: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: UIFontCodingKeys.self)
        try container.encode(self.pointSize, forKey: .pointSize)
        try container.encode(self.fontName, forKey: .name)
    }
}
enum UIFontCodingKeys: String, CodingKey {
    case pointSize
    case name
}

