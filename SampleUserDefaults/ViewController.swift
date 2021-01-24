//
//  ViewController.swift
//  SampleUserDefaults
//
//  Created by 冨田康介 on 2021/01/11.
//  Copyright © 2021 kosuketomita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let keyLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 30))
    let valueLabel = UILabel(frame: CGRect(x: 100, y: 200, width: 100, height: 30))
    let button = UIButton(frame: CGRect(x: 200, y: 100, width: 100, height: 30))
    let state = State.shared
    
    let naviButton = UIButton(frame: CGRect(x: 100, y: 300, width: 100, height: 100))
    let pagerbutton = UIButton(frame: CGRect(x: 220, y: 300, width: 100, height: 100))
    let toLoginButton = UIButton()
    let toTableViewButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(keyLabel)
        view.addSubview(valueLabel)
        view.addSubview(button)
        view.addSubview(naviButton)
        view.addSubview(pagerbutton)
        view.addSubview(toLoginButton)
        view.addSubview(toTableViewButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        keyLabel.text = "課金状態"
        keyLabel.textColor = .black
        valueLabel.text = String(state.getHasPurchase())
        valueLabel.textColor = .black
        
        button.setTitle("切り替え", for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(switchState), for: .touchUpInside)
        
        naviButton.setTitle("サンプル１", for: .normal)
        naviButton.backgroundColor = .green
        naviButton.addTarget(self, action: #selector(presentNavi), for: .touchUpInside)
        
        pagerbutton.setTitle("サンプル２", for: .normal)
        pagerbutton.backgroundColor = .red
        pagerbutton.addTarget(self, action: #selector(presentThird), for: .touchUpInside)
        
        toLoginButton.setTitle("ログイン画面へ", for: .normal)
        toLoginButton.backgroundColor = .orange
        toLoginButton.addTarget(self, action: #selector(presentLogin), for: .touchUpInside)
        toLoginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toLoginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            toLoginButton.widthAnchor.constraint(equalToConstant: toLoginButton.intrinsicContentSize.width),
            toLoginButton.heightAnchor.constraint(equalToConstant: toLoginButton.intrinsicContentSize.height)
            
        ])
        
        toTableViewButton.setTitle("テーブルビュー画面へ", for: .normal)
        toTableViewButton.backgroundColor = .orange
        toTableViewButton.addTarget(self, action: #selector(presentTableView), for: .touchUpInside)
        toTableViewButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toTableViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            toTableViewButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            toTableViewButton.topAnchor.constraint(equalTo: toLoginButton.bottomAnchor),
            toTableViewButton.widthAnchor.constraint(equalToConstant: toTableViewButton.intrinsicContentSize.width),
            toTableViewButton.heightAnchor.constraint(equalToConstant: toTableViewButton.intrinsicContentSize.height)
            
        ])
        
    }
    
    @objc
    func switchState() {
        state.setHasPurchase(value: !state.getHasPurchase())
        update()
    }
    
    @objc
    func presentNavi() {
        let secondVC = SecondViewController()
        let rootNavigationC = UINavigationController(rootViewController: secondVC)
        rootNavigationC.modalPresentationStyle = .fullScreen
        self.present(rootNavigationC, animated: true)
    }
    
    @objc
    func presentThird() {
        let vc = ThirdViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
    func update() {
        valueLabel.text = String(state.getHasPurchase())
    }
    
    @objc
    func presentLogin() {
        let vc = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
    @objc
    func presentTableView() {
        let vc = TableViewController(style: .grouped)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
}

