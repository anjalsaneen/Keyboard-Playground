import UIKit
import SwiftUI

protocol KeyboardActionDelegate: AnyObject {
    func keyWasPressed(_ key: String)
    func openHostApp(url: URL)
}

class KeyboardViewController: UIInputViewController, KeyboardActionDelegate {
    
    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var customKeyboardView = CustomKeyboardView()
        customKeyboardView.delegate = self // Set the delegate
        
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
    
    func keyWasPressed(_ key: String) {
    }
    
    func openHostApp(url: URL) {
        extensionContext?.open(url, completionHandler: { (success) in
            if success {
                print("Opened \(url)")
            } else {
                print("Failed to open \(url)")
            }
        })
    }
}

struct CustomKeyboardView: View {
    weak var delegate: KeyboardActionDelegate?
    var body: some View {
        Spacer()
        
        Text("Open Host App")
            .bold()
            .multilineTextAlignment(.center)
            .font(.system(size: 18))
            .padding(.top, 12)
        
        Button(action: {
            if let url = URL(string: "myapp://") {
                print("clicked. opening url")
                delegate?.openHostApp(url: url)
            }
        }) {
            Text("Open App")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.vertical, 14)
                .background(Color.blue)
                .padding(.horizontal, 32)
                .cornerRadius(10)
        }.padding()
        
        Spacer()
    }
}
