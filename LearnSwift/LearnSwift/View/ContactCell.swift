//
//  ContactCell.swift
//  LearnSwift
//
//  Created by Ankur on 12/18/18.
//  Copyright © 2018 ankur. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPhoneNumber: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var contactObj : contact? {
        didSet {
          labelName.text = contactObj?.name
          labelPhoneNumber.text = contactObj?.phoneNumbar
          labelEmail.text = contactObj?.email
        }
    }

}
