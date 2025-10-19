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
        testMethod()
    }
    
    // MARK: - SetupsView
    private func setupViews() {
        myLabel.text = "Hello UIKit!"
    }
    
    private func testMethod() {
        
    }
}
