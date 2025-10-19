//
//  UIColor+.swift
//  LearnSwiftUI
//
//  Created by Le on 19/10/25.
//

import UIKit

extension UIColor {
    // MARK: - Method Swizzling
    @objc func hexDescription() -> String {
        return hexString
    }
    
    func swizzleDesription() {
        if let aClass = object_getClass(self),
           let originalMethod = class_getInstanceMethod(aClass, #selector(getter: description)),
           let swizzledMethod = class_getInstanceMethod(aClass, #selector(hexDescription)) {
            method_exchangeImplementations(originalMethod, swizzledMethod)
            print("\nSwizzle\n")
        }
    }
    
    var hexString: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb: Int = (Int)(r * 255) << 16 | (Int)(g * 255) << 8 | (Int)(b * 255) << 0
        return String(format: "#%06x", rgb)
    }
}
