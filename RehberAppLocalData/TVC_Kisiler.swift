//
//  TVC_Kisiler.swift
//  RehberAppLocalData
//
//  Created by Sinan Kulen on 25.01.2022.
//

import UIKit

class TVC_Kisiler: UITableViewCell {

    @IBOutlet var ivResim: UIImageView!
    @IBOutlet var lblSoyad: UILabel!
    @IBOutlet var lblAd: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
