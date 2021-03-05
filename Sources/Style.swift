//
//  Created by Pavel Sharanda on 21.02.17.
//  Copyright © 2017 psharanda. All rights reserved.
//

import Foundation
import UIKit

public enum StyleType {
    case normal
    case disabled
    case highlighted
}

public struct Style {
    
    public let name: String
    
    public var attributes: [NSAttributedString.Key: Any] {
        return typedAttributes[.normal] ?? [:]
    }
    
    public var highlightedAttributes: [NSAttributedString.Key: Any] {
        var attrs = attributes
        
        typedAttributes[.highlighted]?.forEach { key, value in
            attrs.updateValue(value, forKey: key)
        }
        
        return attrs
    }
    
    public var disabledAttributes: [NSAttributedString.Key: Any] {
        var attrs = attributes
        
        typedAttributes[.disabled]?.forEach { key, value in
            attrs.updateValue(value, forKey: key)
        }
        
        return attrs
    }
    
    public let typedAttributes: [StyleType: [NSAttributedString.Key: Any]]
    
    public init(_ name: String = "", style: Style? = nil) {
        self.name = name
        self.typedAttributes = style?.typedAttributes ?? [:]
    }
    
    public init(_ name: String = "", _ attributes: [NSAttributedString.Key: Any], _ type: StyleType = .normal) {
        self.name = name
        self.typedAttributes = [type: attributes]
    }
    
    public init(_ name: String = "", _ typedAttributes: [StyleType: [NSAttributedString.Key: Any]]) {
        self.name = name
        self.typedAttributes = typedAttributes
    }
    
    public func named(_ name: String) -> Style {
        return Style(name, style: self)
    }
    
    public func merged(with style: Style) -> Style {
        var attrs = typedAttributes
    
        style.typedAttributes.forEach { type, attributes in
            attributes.forEach { key, value in
                attrs[type, default: [:]].updateValue(value, forKey: key)
            }
        }
        
        return Style(name, attrs)
    }
    
    public func font(_ value: UIFont, _ type: StyleType = .normal) -> Style {
        return merged(with: Style.font(value, type))
    }
    
    public func paragraphStyle(_ value: NSParagraphStyle, _ type: StyleType = .normal) -> Style {
        return merged(with: Style.paragraphStyle(value, type))
    }
    
    public func foregroundColor(_ value: UIColor, _ type: StyleType = .normal) -> Style {
        return merged(with: Style.foregroundColor(value, type))
    }
    
    public func backgroundColor(_ value: UIColor, _ type: StyleType = .normal) -> Style {
        return merged(with: Style.backgroundColor(value, type))
    }
    
    public func ligature(_ value: Int, _ type: StyleType = .normal) -> Style {
        return merged(with: Style.ligature(value, type))
    }
    
    public func kern(_ value: Float, _ type: StyleType = .normal) -> Style {
        return merged(with: Style.kern(value, type))
    }
    
    public func strikethroughStyle(_ value: NSUnderlineStyle, _ type: StyleType = .normal) -> Style {
        return merged(with: Style.strikethroughStyle(value, type))
    }
    
    public func strikethroughColor(_ value: UIColor, _ type: StyleType = .normal) -> Style {
        return merged(with: Style.strikethroughColor(value, type))
    }
    
    public func underlineStyle(_ value: NSUnderlineStyle, _ type: StyleType = .normal) -> Style {
        return merged(with: Style.underlineStyle(value, type))
    }
    
    public func underlineColor(_ value: UIColor, _ type: StyleType = .normal) -> Style {
        return merged(with: Style.underlineColor(value, type))
    }
    
    public func strokeColor(_ value: UIColor, _ type: StyleType = .normal) -> Style {
        return merged(with: Style.strokeColor(value, type))
    }
    
    public func strokeWidth(_ value: Float, _ type: StyleType = .normal) -> Style {
        return merged(with: Style.strokeWidth(value, type))
    }
    
    public func textEffect(_ value: String, _ type: StyleType = .normal) -> Style {
        return merged(with: Style.textEffect(value, type))
    }
    
    public func link(_ value: URL, _ type: StyleType = .normal) -> Style {
        return merged(with: Style.link(value, type))
    }
    
    public func link(_ value: String, _ type: StyleType = .normal) -> Style {
        return merged(with: Style.link(value, type))
    }
    
    public func baselineOffset(_ value: Float, _ type: StyleType = .normal) -> Style {
        return merged(with: Style.baselineOffset(value, type))
    }
    
    public func obliqueness(_ value: Float, _ type: StyleType = .normal) -> Style {
        return merged(with: Style.obliqueness(value, type))
    }
    
    public func expansion(_ value: Float, _ type: StyleType = .normal) -> Style {
        return merged(with: Style.expansion(value, type))
    }
    
    public func writingDirection(_ value: NSWritingDirection, _ type: StyleType = .normal) -> Style {
        return merged(with: Style.writingDirection(value, type))
    }
    
    public func custom(_ value: Any, forAttributedKey key: NSAttributedString.Key, _ type: StyleType = .normal) -> Style {
        return merged(with: Style.custom(value, forAttributedKey: key, type))
    }
    
    public static func font(_ value: UIFont, _ type: StyleType = .normal) -> Style {
        return Style("", [NSAttributedString.Key.font: value], type)
    }
    
    public static func paragraphStyle(_ value: NSParagraphStyle, _ type: StyleType = .normal) -> Style {
        return Style("", [NSAttributedString.Key.paragraphStyle: value], type)
    }
    
    public static func foregroundColor(_ value: UIColor, _ type: StyleType = .normal) -> Style {
        return Style("", [NSAttributedString.Key.foregroundColor: value], type)
    }
    
    public static func backgroundColor(_ value: UIColor, _ type: StyleType = .normal) -> Style {
        return Style("", [NSAttributedString.Key.backgroundColor: value], type)
    }
    
    public static func ligature(_ value: Int, _ type: StyleType = .normal) -> Style {
        return Style("", [NSAttributedString.Key.ligature: value], type)
    }
    
    public static func kern(_ value: Float, _ type: StyleType = .normal) -> Style {
        return Style("", [NSAttributedString.Key.kern: value], type)
    }
    
    public static func strikethroughStyle(_ value: NSUnderlineStyle, _ type: StyleType = .normal) -> Style {
        return Style("", [NSAttributedString.Key.strikethroughStyle: value.rawValue], type)
    }
    
    public static func strikethroughColor(_ value: UIColor, _ type: StyleType = .normal) -> Style {
        return Style("", [NSAttributedString.Key.strikethroughColor: value], type)
    }
    
    public static func underlineStyle(_ value: NSUnderlineStyle, _ type: StyleType = .normal) -> Style {
        return Style("", [NSAttributedString.Key.underlineStyle: value.rawValue], type)
    }
    
    public static func underlineColor(_ value: UIColor, _ type: StyleType = .normal) -> Style {
        return Style("", [NSAttributedString.Key.underlineColor: value], type)
    }
    
    public static func strokeColor(_ value: UIColor, _ type: StyleType = .normal) -> Style {
        return Style("", [NSAttributedString.Key.strokeColor: value], type)
    }
    
    public static func strokeWidth(_ value: Float, _ type: StyleType = .normal) -> Style {
        return Style("", [NSAttributedString.Key.strokeWidth: value], type)
    }
    
    public static func textEffect(_ value: String, _ type: StyleType = .normal) -> Style {
        return Style("", [NSAttributedString.Key.textEffect: value], type)
    }
    
    public static func link(_ value: URL, _ type: StyleType = .normal) -> Style {
        return Style("", [NSAttributedString.Key.link: value], type)
    }
    
    public static func link(_ value: String, _ type: StyleType = .normal) -> Style {
        return Style("", [NSAttributedString.Key.link: value], type)
    }
    
    public static func baselineOffset(_ value: Float, _ type: StyleType = .normal) -> Style {
        return Style("", [NSAttributedString.Key.baselineOffset: value], type)
    }
    
    public static func obliqueness(_ value: Float, _ type: StyleType = .normal) -> Style {
        return Style("", [NSAttributedString.Key.obliqueness: value], type)
    }
    
    public static func expansion(_ value: Float, _ type: StyleType = .normal) -> Style {
        return Style("", [NSAttributedString.Key.expansion: value], type)
    }
    
    public static func writingDirection(_ value: NSWritingDirection, _ type: StyleType = .normal) -> Style {
        return Style("", [NSAttributedString.Key.writingDirection: value.rawValue], type)
    }
    
    public static func custom(_ value: Any, forAttributedKey key: NSAttributedString.Key, _ type: StyleType = .normal) -> Style {
        return Style("", [key: value], type)
    }
}
