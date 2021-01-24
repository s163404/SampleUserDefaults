//
//  TextFieldViewController.swift
//  SampleUserDefaults
//
//  Created by 冨田康介 on 2021/01/24.
//  Copyright © 2021 kosuketomita. All rights reserved.
//

import UIKit

class TextFieldViewController: UIViewController {

    let textField1 = UITextField()
    let textField2 = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(textField1)
        view.addSubview(textField2)

        textField1.translatesAutoresizingMaskIntoConstraints = false
        textField1.placeholder = "テキスト"
        textField1.borderStyle = .roundedRect
        textField1.delegate = self
        
        textField2.translatesAutoresizingMaskIntoConstraints = false
        textField2.placeholder = "粕谷秀樹"
        textField2.borderStyle = .roundedRect
        textField2.delegate = self
        
        NSLayoutConstraint.activate([
            textField1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.bounds.height * 1/5),
            textField2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: -view.bounds.height * 1/5),
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
        
        let firstResponder = textField1.isFirstResponder ? textField1 : textField2
        
        
        if textField1.isFirstResponder || textField2.isFirstResponder {
            guard let userInfo = sender.userInfo else { return }
            
            let keyboardFrameInfo = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
            let keyboardSize = keyboardFrameInfo.cgRectValue.size
            let duration: Float = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).floatValue

            UIView.animate(withDuration: TimeInterval(duration), animations: { () -> Void in
//                let transform = CGAffineTransform(translationX: 0, y: -keyboardSize.height)
//                self.view.transform = transform
                if self.view.frame.origin.y == 0 {
                    self.view.frame.origin.y -= keyboardSize.height
                }
            })
        }
    }

    // キーボードが閉じられた時
    @objc private func keyboardWillHide(sender: NSNotification) {
        guard let userInfo = sender.userInfo else { return }
        let duration: Float = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).floatValue
        UIView.animate(withDuration: TimeInterval(duration), animations: { () -> Void in
//            self.view.transform = CGAffineTransform.identity
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        })
    }

}

extension TextFieldViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
