//
//  MediaScreenVC.swift
//  CTU
//
//  Created by STTL on 09/07/24.
//

import UIKit

class MediaScreenVC: UIViewController {

    //Outlets
    @IBOutlet weak var CollectionViewIB: UICollectionView!
    
    //Variables
    var mediaDataSourceDelegate : MediaDataSourceDelegate!
    var webService = MediaWebServices()
    var arrData : [MediaModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }
    
    //Function For Getting Data from JSON to Dictionary
    func getData(){
        webService.getMediaItemList{ arr in
            arrData = arr
        }
        setUpCollectionView()
    }
    
    // Set up Vertical collection View
    func setUpCollectionView() {
        if mediaDataSourceDelegate == nil {
            mediaDataSourceDelegate = .init(arrData: arrData , delegate: self, col: CollectionViewIB, vc: self)
        }
    }

}

//MARK:- Extension for ColViewDelegate
extension MediaScreenVC: ColViewDelegate {
    func didSelect(colView: UICollectionView, indexPath: IndexPath) {
//        Navigation.navigateToOtherController("AboutCTUIL", "AboutCTUILVC", from: self)
    }
}
