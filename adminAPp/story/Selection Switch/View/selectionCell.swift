//
//  selectionCell.swift
//  adminAPp
//
//  Created by Ulvi Bashirov on 10/1/20.
//

import UIKit

class selectionCell: UITableViewCell {

    @IBOutlet weak var cellSwitch: UISwitch!
    @IBOutlet weak var cellLabel: UILabel!
    
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpCell(labelText: String, switchStatus: Bool, indexPath index: IndexPath) {
        cellLabel.text = labelText
        cellSwitch.setOn(switchStatus, animated: true)
        indexPath = index
    }

    @IBAction func cellValueChanged(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("statusChanged"), object: nil, userInfo: ["indexPath": indexPath!, "status": cellSwitch.isOn])
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        cellLabel.text = nil
    }
}
