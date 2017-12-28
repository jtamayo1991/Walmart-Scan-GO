//
//  MenuCell.swift
//  walmartScan
//
//  Created by admin on 12/28/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    

    @IBOutlet weak var imgIcon: UIImageView!
    
    @IBOutlet weak var lblMenuname: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

