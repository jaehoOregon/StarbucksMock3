//
//  OrderMenuTableViewCell.swift
//  StarbucksMock3
//
//  Created by Jaeho Jung on 2022/11/16.
//

import UIKit

class OrderMenuTableViewCell: UITableViewCell {

    
    @IBOutlet weak var orderMenuImage: UIImageView!
    @IBOutlet weak var orderMenuNameKorean: UILabel!
    @IBOutlet weak var orderMenuNameEnglish: UILabel!
    @IBOutlet weak var orderMenuPrice: UILabel!
    @IBOutlet weak var orderMenuSeasonImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
