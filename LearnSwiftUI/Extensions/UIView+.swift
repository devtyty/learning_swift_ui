//
//  UIView+.swift
//  LearnSwiftUI
//
//  Created by Le on 19/10/25.
//

import UIKit

extension UIView {
    func findViewController() -> UIViewController? {
        var responder: UIResponder? = self
        while let r = responder {
            if let vc = r as? UIViewController {
                return vc
            }
            responder = r.next
        }
        return nil
    }
}

