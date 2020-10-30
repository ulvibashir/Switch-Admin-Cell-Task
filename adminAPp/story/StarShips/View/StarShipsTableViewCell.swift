//
//  StarShipsTableViewCell.swift
//  adminAPp
//
//  Created by Ulvi Bashirov on 10/7/20.
//

import UIKit

class StarShipsTableViewCell: UITableViewCell {

    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup() {
        self.backgroundColor = UIColor.white
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 4.0, height: 7.0)
        self.layer.shadowOpacity = 3.0
        self.layer.shadowRadius = 7.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 15.0
        
    }
}
