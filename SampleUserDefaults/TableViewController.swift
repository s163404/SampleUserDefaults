//
//  TableViewController.swift
//  SampleUserDefaults
//
//  Created by 冨田康介 on 2021/01/19.
//  Copyright © 2021 kosuketomita. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let cellIdentifier = "cell"
    
    class HeaderView: UIView {
        var label: UILabel
        var imageView: UIImageView
        
        static let headerHeight: CGFloat = 350
        
        override init(frame: CGRect) {
            label = UILabel()
            let image = UIImage(named: "cassette_tape")
            imageView = UIImageView(image: image)
            super.init(frame: frame)
            self.bounds.size.height = HeaderView.headerHeight
            

            label.text = "エヴァンゲリオンの登場人物"
            label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
            label.textAlignment = .center
            label.numberOfLines = 0
            label.layer.borderWidth = 2
            imageView.contentMode = .scaleAspectFit
            imageView.layer.borderWidth = 2
            
            self.addSubview(label)
            self.addSubview(imageView)
            
            label.translatesAutoresizingMaskIntoConstraints = false
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                label.topAnchor.constraint(equalTo: self.topAnchor),
                label.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 4/5),
                label.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/3),
                
                imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                imageView.topAnchor.constraint(equalTo: label.bottomAnchor),
                imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 3/5),
                imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/3),
            ])
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    lazy var headerView = HeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        view.addSubview(headerView)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        var text = ""
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                text = "碇シンジ"
            case 1:
                text = "渚カヲル"
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                text = "式波・アスカ・ラングレー"
            case 1:
                text = "真希波・マリ・イラストリアス"
            default:
                break
            }
        default:
            break
        }
        
        cell.textLabel?.text = text
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "NERV"
        case 1:
            return "WILLE"
        default:
            return "戦略自衛隊"
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return headerView
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height = tableView.sectionHeaderHeight
        switch section {
        case 0:
            height += HeaderView.headerHeight
            return height
        default:
            // defaultのセクション高さ
            return height
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
