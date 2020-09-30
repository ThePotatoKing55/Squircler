//
//  Defaults.swift
//  Squircler
//
//  Created by Aidan Cline on 9/29/20.
//

import Foundation

extension Notification.Name {
    static let setScreenCornerRadius = Notification.Name(rawValue: "setScreenCornerRadius")
}

struct Defaults {
    
    typealias Key = UserDefaults.Key
    
    private static var userDefaults: UserDefaults {
        UserDefaults.standard
    }
    
    private init() {}
    
    static let defaultScreenCornerRadius: Float = 20.0
    
    static var screenCornerRadius: Float {
        get {
            Defaults.hasSetRadius ? userDefaults.float(for: .screenCornerRadius) : defaultScreenCornerRadius
        }
        set {
            userDefaults.set(newValue < 0 ? defaultScreenCornerRadius : newValue, for: .screenCornerRadius)
            NotificationCenter.default.post(name: .setScreenCornerRadius, object: nil)
            Defaults.hasSetRadius = true
        }
    }
    
    static var hasSetRadius: Bool {
        get {
            userDefaults.bool(for: .hasSetRadius)
        }
        set {
            userDefaults.set(newValue, for: .hasSetRadius)
        }
    }
    
}

extension UserDefaults {
    public enum Key: String, CaseIterable {
        case screenCornerRadius, hasSetRadius
    }
    
    public func float(for key: Key) -> Float {
        float(forKey: key.rawValue)
    }
    
    public func bool(for key: Key) -> Bool {
        bool(forKey: key.rawValue)
    }
    
    public func value(for key: Key) -> Any? {
        value(forKey: key.rawValue)
    }
    
    public func string(for key: Key) -> String? {
        string(forKey: key.rawValue)
    }
    
    public func set(_ value: Any?, for key: Key) {
        setValue(value, forKey: key.rawValue)
    }
    
    public func value<T>(for key: Key) -> T? where T: Any {
        value(for: key) as? T
    }
}

extension UserDefaults.Key: CustomStringConvertible {
    public var description: String {
        rawValue
    }
}
