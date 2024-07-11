//
//  HomeScreenVC.swift
//  CTU
//
//  Created by STTL on 17/06/24.
//

import UIKit

class HomeScreenVC: UIViewController {

    //Outlets
    @IBOutlet weak var btnTabBar: UITabBarItem!
    @IBOutlet weak var CollectionViewIB: UICollectionView!
    @IBOutlet weak var PageControl: UIPageControl!
    @IBOutlet weak var GridCollectionViewIB: UICollectionView!
    
    //Variables
    var currentCellIndex = 0
    var photos = ["img1","img2","img3","img4"]
    var timer : Timer?
    var verticalDatasourceDelegate : VerticalDataSourceDelegate!
    var webService = GridItemWebServices()
    var arrData : [GridItemModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        
        PageControl.numberOfPages = photos.count
        
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
    }
    
    //Function For Getting Data from JSON to Dictionary
    func getData(){
        webService.getGridItemList{ arr in
            arrData = arr
        }
        setUpCollectionView()
    }
    
    // Set up Vertical collection View
    func setUpCollectionView() {
        if verticalDatasourceDelegate == nil {
            verticalDatasourceDelegate = .init(arrData: arrData , delegate: self, col: GridCollectionViewIB, vc: self)
        }
    }
    
    //Selector Function
    @objc func slideToNext ()
    {
        if currentCellIndex < photos.count - 1 {
            currentCellIndex = currentCellIndex + 1
        }else{
            currentCellIndex = 0
        }
        
        PageControl.currentPage = currentCellIndex // Set Current page for PageControl
        
        // Slide Images
        CollectionViewIB.scrollToItem(at: IndexPath(item: currentCellIndex ,section:0), at: .right, animated: true)
    }

}

extension HomeScreenVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionViewIB.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCVC
        cell.Img.image = UIImage(named: photos[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CollectionViewIB.frame.width, height: CollectionViewIB.frame.height)
    }
    
}

//MARK:- Extension for ColViewDelegate
extension HomeScreenVC: ColViewDelegate {
    func didSelect(colView: UICollectionView, indexPath: IndexPath) {
        Navigation.navigateToOtherController("AboutCTUIL", "AboutCTUILVC", from: self)
    }
}
