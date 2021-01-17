//
//  LoginViewController.swift
//  SampleUserDefaults
//
//  Created by 冨田康介 on 2021/01/16.
//  Copyright © 2021 kosuketomita. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let rootStackView = UIStackView()
    let subStackView = UIStackView()
    
    let textView = UITextView()
    let topButton = UIButton()
    let memoLabel = UILabel()
    let leftBorderLineView = BorderLineView()
    let rightBorderLineView = BorderLineView()
    let descLabel = UILabel()
    let bottomButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        textView.isScrollEnabled = false
        textView.text = "サンプル説明\nぐるぐるぐるぐる\nグルコサミン"
        textView.font = UIFont.systemFont(ofSize: 25)
        textView.backgroundColor = .yellow
        textView.isSelectable = false
        topButton.setTitle("ログインへ", for: .normal)
        topButton.layer.cornerRadius = 20
        topButton.backgroundColor = .link
        memoLabel.text = "または"
        memoLabel.font = UIFont.systemFont(ofSize: 20)
        memoLabel.backgroundColor = .lightGray
        memoLabel.backgroundColor = .white
        descLabel.text = "アカウントをお持ちでない"
        descLabel.backgroundColor = .lightGray
        bottomButton.setTitle("新規登録", for: .normal)
        bottomButton.backgroundColor = .link
        
        rootStackView.axis = .vertical
        rootStackView.alignment = .center
        rootStackView.distribution = .fillProportionally
        rootStackView.spacing = 40
        subStackView.axis = .horizontal
        subStackView.alignment = .fill
        subStackView.spacing = 10
        subStackView.distribution = .fillProportionally
        
        view.addSubview(rootStackView)
        rootStackView.addArrangedSubview(textView)
        rootStackView.addArrangedSubview(topButton)
        rootStackView.addArrangedSubview(subStackView)
        rootStackView.addArrangedSubview(descLabel)
        rootStackView.addArrangedSubview(bottomButton)
        subStackView.addArrangedSubview(leftBorderLineView)
        subStackView.addArrangedSubview(memoLabel)
        subStackView.addArrangedSubview(rightBorderLineView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        rootStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rootStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        subStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            subStackView.widthAnchor.constraint(equalToConstant: rootStackView.bounds.size.width),
//            subStackView.leadingAnchor.constraint(equalTo: rootStackView.leadingAnchor),
        ])
        topButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // aliginment=center, distrobution=fillpropotionalyでは制約で幅をつけられる
            topButton.widthAnchor.constraint(equalToConstant: view.bounds.size.width * 0.8)
        ])

        leftBorderLineView.translatesAutoresizingMaskIntoConstraints = false
        rightBorderLineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftBorderLineView.widthAnchor.constraint(equalToConstant: view.bounds.size.width * 1/5),
            rightBorderLineView.widthAnchor.constraint(equalToConstant: view.bounds.size.width * 1/5),
            memoLabel.widthAnchor.constraint(equalToConstant: memoLabel.intrinsicContentSize.width)
            
        ])
        
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomButton.widthAnchor.constraint(equalToConstant: view.bounds.size.width * 0.8),
        ])
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            rootStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.safeAreaInsets.top),
            rootStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.safeAreaInsets.bottom-view.bounds.size.height * 1/4),
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print(textView.intrinsicContentSize)
        print(topButton.intrinsicContentSize)
        print(rootStackView.bounds.size.width)
    }

}
