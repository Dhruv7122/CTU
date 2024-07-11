//
//  MediaCVC.swift
//  CTU
//
//  Created by STTL on 09/07/24.
//

import UIKit

class MediaCVC: UICollectionViewCell {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(data:MediaModel){
        imgView.image = UIImage(named: data.img)
        lblText.text = data.name
    }
}
