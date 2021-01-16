//
//  ThirdViewController.swift
//  SampleUserDefaults
//
//  Created by 冨田康介 on 2021/01/14.
//  Copyright © 2021 kosuketomita. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    let rootStackView = UIStackView()
    let topSubStackView  = UIStackView()
    let bottomSubStackView  = UIStackView()
    let switch1 = UISwitch()
    let redView = UIView()
    let blueView = UIView()
    let leftLabel = UILabel()
    let rightLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootStackView.axis = .vertical
        rootStackView.backgroundColor = .white
        rootStackView.distribution = .fillEqually
        rootStackView.alignment = .center
        rootStackView.alignment = .fill
        rootStackView.spacing = 20
        topSubStackView.backgroundColor = .orange
        bottomSubStackView.backgroundColor = .systemPink
        bottomSubStackView.axis = .horizontal
        bottomSubStackView.spacing = 30
        bottomSubStackView.distribution = .fillEqually
        redView.backgroundColor = .red
        blueView.backgroundColor = .blue
        leftLabel.text = "ひだーり"
        leftLabel.backgroundColor = .green
        rightLabel.text = "みーぎ"
        rightLabel.backgroundColor = .green
        
        
        view.addSubview(rootStackView)
        rootStackView.addArrangedSubview(redView)
        rootStackView.addArrangedSubview(blueView)
        rootStackView.addArrangedSubview(switch1)
        rootStackView.addArrangedSubview(bottomSubStackView)
        bottomSubStackView.addArrangedSubview(leftLabel)
        bottomSubStackView.addArrangedSubview(rightLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        rootStackView.translatesAutoresizingMaskIntoConstraints = false
        rootStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        rootStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        redView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
        bottomSubStackView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        rootStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.safeAreaInsets.top).isActive = true
        rootStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.safeAreaInsets.bottom).isActive = true
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
