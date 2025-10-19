//
//  TestViewController.swift
//  LearnSwiftUI
//
//  Created by Le on 19/10/25.
//

import UIKit

final class TestViewController: UIViewController {
    // MARK: - Outlet
    @IBOutlet weak var myLabel: UILabel!
    
    // MARK: - LifeCycle
    override func loadView() {
        let nib = UINib(nibName: "TestViewController", bundle: nil)
        view = nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        let label = UILabel()
        label.text = "This is a UIViewController!"
        label.textColor = .white
        label.textAlignment = .center
        label.frame = view.bounds
        view.addSubview(label)
        
        setupViews()
        //testMethod()
        testSwizzling()
        addTestButton()
    }
    
    // MARK: - SetupsView
    private func setupViews() {
        myLabel.text = "Hello UIKit!"
    }
    
    private func testMethod() {
        let object = MyClass()
        print("class addr:", Unmanaged.passUnretained(object).toOpaque())
        
        var s = MyStruct()
        withUnsafePointer(to: &s) { ptr in
            print("struct addr before capture:", ptr)
        }
        
        let closure = makeStruct()
        var s1 = closure()
        withUnsafePointer(to: &s1) { ptr in
            print("struct addr after capture:", ptr)
        }
    }
    
    // MARK: - Test heap & stack storage
    class MyClass {
        var value = 123
    }
    
    struct MyStruct {
        var a = 10
        var b = 20
        
        var arr = Array(repeating: 1, count: 1_000_000)
    }
    
    func makeStruct() -> () -> MyStruct {
        var s = MyStruct()
        return { s } // s capture => heap
    }
    
    func testSwizzling() {
        let color = UIColor.blue
        print("description: \(color)")
        print("hexDescription: \(color.hexDescription())")
        color.swizzleDesription()
        print("description: \(color)")
        print("hexDescription: \(color.hexDescription())")
        _ = UIButton.swizzleSendAction
    }
    
    private func addTestButton() {
        let button = UIButton(type: .system)
        button.setTitle("Tap Me 32423", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 8
        button.frame = CGRect(x: 100, y: 300, width: 150, height: 50)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc private func buttonTapped() {
        print("🎯 Original buttonTapped() called")
    }
}
