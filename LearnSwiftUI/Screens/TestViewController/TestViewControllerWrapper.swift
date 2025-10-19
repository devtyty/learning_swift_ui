//
//  TestViewControllerWrapper.swift
//  LearnSwiftUI
//
//  Created by Le on 19/10/25.
//

import SwiftUI

struct TestViewControllerWrapper: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> TestViewController {
        return TestViewController()
    }
    
    func updateUIViewController(_ uiViewController: TestViewController, context: Context) {
        // Update UI if you want
    }
}
