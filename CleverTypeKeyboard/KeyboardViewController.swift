//
//  KeyboardViewController.swift
//  CleverTypeKeyboard
//
//  Created by Anjal Saneen on 12/07/24.
//

import UIKit
import SwiftUI

protocol KeyboardActionDelegate: AnyObject {
    func keyWasPressed(_ key: String)
}

class KeyboardViewController: UIInputViewController {
    
    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customKeyboardView = CustomKeyboardView()
        let hostingController = UIHostingController(rootView: customKeyboardView)
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        hostingController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        hostingController.didMove(toParent: self)
    }
    
    @objc func keyPressed(_ sender: UIButton) {
        if let title = sender.title(for: .normal) {
            textDocumentProxy.insertText(title)
        }
    }
    
}
