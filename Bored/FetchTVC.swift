//
//  FetchTVC.swift
//  Bored
//
//  Created by TryCatch Classes on 17/10/22.
//

import UIKit

class FetchTVC: UITableViewCell {

    @IBOutlet weak var act: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var members: UILabel!
    @IBOutlet weak var link: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
