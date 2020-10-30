//
//  selectionViewController.swift
//  adminAPp
//
//  Created by Ulvi Bashirov on 10/1/20.
//

import UIKit

class selectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var selectionTableView: UITableView!
    
    var data: [User]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = setData()
        selectionTableView.dataSource = self
        selectionTableView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(statusChanged), name: NSNotification.Name("statusChanged"), object: nil)
    }
    
    struct User {
        var name: String
        var surname: String
        var isEnabled: Bool
        
        init(nameParam: String, surnameParam: String, isEnabledParam: Bool) {
            name = nameParam
            surname = surnameParam
            isEnabled = isEnabledParam
        }
    }
    
    func setData() -> [User] {
        let data: [User] = [User(nameParam: "Ulvi", surnameParam: "Bashirov", isEnabledParam: false),
                            User(nameParam: "Hamza", surnameParam: "Mammadli", isEnabledParam: false),
                            User(nameParam: "Rufat", surnameParam: "Abdulzde", isEnabledParam: false),
                            User(nameParam: "John", surnameParam: "Cena", isEnabledParam: false),
                            User(nameParam: "Johnny", surnameParam: "Depp", isEnabledParam: false),
                            User(nameParam: "Nikola", surnameParam: "Tesla", isEnabledParam: false),
                            User(nameParam: "Ulvi", surnameParam: "Bashirov", isEnabledParam: false),
                            User(nameParam: "Hamza", surnameParam: "Mammadli", isEnabledParam: false),
                            User(nameParam: "Rufat", surnameParam: "Abdulzde", isEnabledParam: false),
                            User(nameParam: "John", surnameParam: "Cena", isEnabledParam: false),
                            User(nameParam: "Johnny", surnameParam: "Depp", isEnabledParam: false),
                            User(nameParam: "Nikola", surnameParam: "Tesla", isEnabledParam: false),
                            User(nameParam: "Ulvi", surnameParam: "Bashirov", isEnabledParam: false),
                            User(nameParam: "Hamza", surnameParam: "Mammadli", isEnabledParam: false),
                            User(nameParam: "Rufat", surnameParam: "Abdulzde", isEnabledParam: false),
                            User(nameParam: "John", surnameParam: "Cena", isEnabledParam: false),
                            User(nameParam: "Johnny", surnameParam: "Depp", isEnabledParam: false),
                            User(nameParam: "Nikola", surnameParam: "Tesla", isEnabledParam: false),
                            User(nameParam: "Ulvi", surnameParam: "Bashirov", isEnabledParam: false),
                            User(nameParam: "Hamza", surnameParam: "Mammadli", isEnabledParam: false),
                            User(nameParam: "Rufat", surnameParam: "Abdulzde", isEnabledParam: false),
                            User(nameParam: "John", surnameParam: "Cena", isEnabledParam: false),
                            User(nameParam: "Johnny", surnameParam: "Depp", isEnabledParam: false),
                            User(nameParam: "Nikola", surnameParam: "Tesla", isEnabledParam: false)]
        return data
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0  { print("s") }
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectionCell", for: indexPath) as! selectionCell
        cell.cellSwitch.setOn(data![indexPath.row].isEnabled, animated: false)
        
        
        cell.setUpCell(labelText: "\(data![indexPath.row].name) \(data![indexPath.row].surname)", switchStatus: data![indexPath.row].isEnabled,
                       indexPath: indexPath)
        return cell
        
    }
    
    @objc func statusChanged(_ notification: Notification) {
        let indexPath = notification.userInfo?["indexPath"] as! IndexPath
        let status = notification.userInfo?["status"] as! Bool
        
        if status {
            for (index, _) in data!.enumerated() {
                if(data![index].isEnabled) {
                    data![index].isEnabled = false
                    let cell = selectionTableView.cellForRow(at: IndexPath(row: index, section: 0)) as? selectionCell
                    cell?.cellSwitch.setOn(false, animated: true)
                }
            }
        }
        
        
        
        data![indexPath.row].isEnabled = status
        
        
        
        //selectionTableView.reloadData()
    }
}
