//
//  NavigationViewController.swift
//  SampleUserDefaults
//
//  Created by 冨田康介 on 2021/01/12.
//  Copyright © 2021 kosuketomita. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        label.text = "ああああ"
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
