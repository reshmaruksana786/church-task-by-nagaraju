//
//  TableViewCell.swift
//  TecnicalTaskForrvtec
//
//  Created by THOTA NAGARAJU on 1/31/20.
//  Copyright © 2020 THOTA NAGARAJU. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    
    @IBOutlet weak var addressLbl: UILabel!
    
   
    @IBOutlet weak var imagVw: UIImageView!
    
    @IBOutlet weak var discritLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
