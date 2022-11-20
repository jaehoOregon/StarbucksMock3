//
//  MenuTableViewCell.swift
//  StarbucksMock3
//
//  Created by Jaeho Jung on 2022/11/16.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuNameKorean: UILabel!
    @IBOutlet weak var menuNameEnglish: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
