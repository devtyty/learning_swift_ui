//
//  UIButton+.swift
//  LearnSwiftUI
//
//  Created by Le on 19/10/25.
//

import UIKit

extension UIButton {
    static let swizzleSendAction: Void = {
        let original = #selector(UIButton.sendAction(_:to:for:))
        let swizzled = #selector(UIButton.swizzled_sendAction(_:to:for:))
        
        guard let originalMethod = class_getInstanceMethod(UIButton.self, original),
              let swizzledMethod = class_getInstanceMethod(UIButton.self, swizzled)
        else { return }
        
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }()
    
    @objc func swizzled_sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        if let vc = self.findViewController() {
            print("👆 Button tapped: \(self.currentTitle ?? "no title") in \(type(of: vc))")
        } else {
            print("👆 Button tapped: \(self.currentTitle ?? "no title") in UnknownViewController")
        }
        
        swizzled_sendAction(action, to: target, for: event)
    }
}
