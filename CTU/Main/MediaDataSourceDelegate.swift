//
//  TenDatasourceDelegate.swift
//  DhruvApp
//  purpose : Set up Table View
//  Created by STTL on 18/04/24.
//

import Foundation
import UIKit



class MediaDataSourceDelegate: NSObject {
    
    //Datatype Alias
//    typealias T = UserModel
    typealias T = MediaModel
    typealias col = UICollectionView
    typealias del = ColViewDelegate
    typealias vc = UIViewController
    
    //Internal Variables
    internal var arrSource: [T]
    internal var colvw: col
    internal var delegate: del
    internal weak var vc:vc?
    
    //Variables
    let kNumberOfItemsInOneRow: CGFloat = 2
    let kEdgeInset:CGFloat = 20
    let minimumInterItemandLinespacing:CGFloat = 20
    
    //MARK:- Initializers
    required init(arrData: [T], delegate: ColViewDelegate, col: UICollectionView,vc:vc) {
        arrSource = arrData
        colvw = col
        self.delegate = delegate
        self.vc = vc
        super.init()
        setupCol()
    }
    
    //SetUp Collection VIew
    fileprivate func setupCol(){
        
        let nib = UINib(nibName: "MediaCVC", bundle: nil)
        colvw.register(nib, forCellWithReuseIdentifier: "MediaCVC")
        colvw.dataSource = self
        colvw.delegate = self
        colvw.reloadData()
    }
    
    //Reload CollectionView
    func reload(arr:[T]){
        arrSource = arr
        colvw.reloadData()
    }
}

//MARK:- Extension for Collection View delegate
extension MediaDataSourceDelegate:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.didSelect(colView: colvw, indexPath: indexPath)
    }
    
}

//MARK:- Extension for Collection View DataSource
extension MediaDataSourceDelegate:UICollectionViewDataSource {
    
    //No. of Items in Section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    //Values Of Cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MediaCVC", for: indexPath) as! MediaCVC
        cell.configCell(data: arrSource[indexPath.row])
        return cell
    }
}


//MARK:- UICollectionViewDelegateFlowLayout Methods
extension MediaDataSourceDelegate: UICollectionViewDelegateFlowLayout {
    
    //Minimum Line Spacing For Section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInterItemandLinespacing
    }
    
    //Minimum Spacing Between Items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInterItemandLinespacing
    }
    
    //Size of an Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 60) / 2
        let height = width + 18
        let lineHeight = "dhruv".height(withConstrainedWidth: width, font: .systemFont(ofSize: 16, weight: .regular))
        return .init(width: width, height: height + (lineHeight * 2))
    }
    
    //Whole Section Padding
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: kEdgeInset, left: kEdgeInset, bottom: kEdgeInset, right: kEdgeInset)
    }
}

