//
//  GridCVC.swift
//  CTU
//
//  Created by STTL on 09/07/24.
//

import UIKit

class GridCVC: UICollectionViewCell {

    @IBOutlet weak var IconContainer: UIView!
    @IBOutlet weak var Label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        IconContainer.layer.cornerRadius = 10.0
        BorderFactory.addShadow(to: IconContainer,shadowRadius: 4.0, shadowColor: UIColor.black.cgColor, shadowOpacity: 0.2, shadowOffset: CGSize(width: 2, height: 2))
    }
    
    func configCell(data:GridItemModel){
        Label.text = data.name
    }
}
