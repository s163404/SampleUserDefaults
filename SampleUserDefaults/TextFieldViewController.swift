//
//  TextFieldViewController.swift
//  SampleUserDefaults
//
//  Created by 冨田康介 on 2021/01/24.
//  Copyright © 2021 kosuketomita. All rights reserved.
//

import UIKit

class TextFieldViewController: UIViewController {

    let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(textField)

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "テキスト"
        textField.borderStyle = .roundedRect
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.bounds.height * 1/5),
        ])
        
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(sender:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(sender:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        

        // Do any additional setup after loading the view.
    }

    // キーボードが表示された時
    @objc private func keyboardWillShow(sender: NSNotification) {
        if textField.isFirstResponder {
            guard let userInfo = sender.userInfo else { return }
            let duration: Float = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).floatValue
            UIView.animate(withDuration: TimeInterval(duration), animations: { () -> Void in
                let transform = CGAffineTransform(translationX: 0, y: -200)
                self.view.transform = transform
            })
        }
    }

    // キーボードが閉じられた時
    @objc private func keyboardWillHide(sender: NSNotification) {
        guard let userInfo = sender.userInfo else { return }
        let duration: Float = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).floatValue
        UIView.animate(withDuration: TimeInterval(duration), animations: { () -> Void in
            self.view.transform = CGAffineTransform.identity
        })
    }

}
