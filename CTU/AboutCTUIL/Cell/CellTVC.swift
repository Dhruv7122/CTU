//
//  CellTVC.swift
//  CTU
//
//  Created by STTL on 09/07/24.
//

import UIKit

class CellTVC: UITableViewCell {

    @IBOutlet weak var IconImg: UIImageView!
    @IBOutlet weak var txtLabel: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        BorderFactory.addBorder(to: viewContainer, cornerRadius: 10, borderColor: nil, borderWidth: 0)
        BorderFactory.addShadow(to: viewContainer, shadowRadius: 4.0, shadowColor: UIColor.black.cgColor, shadowOpacity: 0.2, shadowOffset: CGSize(width: 2, height: 2))
    }
    
    func configCell(data:AboutCTUILModel){
        IconImg.image = UIImage(named: data.img)
        txtLabel.text = data.name
    }
}
