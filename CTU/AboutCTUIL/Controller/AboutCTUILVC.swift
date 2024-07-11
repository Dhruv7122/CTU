//
//  AboutCTUILVC.swift
//  CTU
//
//  Created by STTL on 09/07/24.
//

import UIKit

class AboutCTUILVC: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    //Variables
    var AboutCTUILDatasourceDelegate : AboutCTUILDataSourceDelegate!
    var webService = AboutCTUILWebServices()
    var arrPractical : [AboutCTUILModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        // Do any additional setup after loading the view.
    }
    
    //Function For Getting Data from JSON
    func getData(){
        webService.getAboutCtuilList { arr in
            arrPractical = arr
        }
        setupTblView()
    }
    
    //SetUP Table Aciton
    func setupTblView(){
        setTabBarHidden(true)
        if AboutCTUILDatasourceDelegate == nil {
            AboutCTUILDatasourceDelegate = .init(arrData: arrPractical, delegate: self, tbl: tblView)
        }
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        setTabBarHidden(false)
        navigationController?.popViewController(animated: true)
    }
    
}

//MARK:- AboutCTUILVC Extension
extension AboutCTUILVC : TblViewDelegate {
    func didselect(tbl: UITableView, indexPath: IndexPath) {
        let selectedItem = arrPractical[indexPath.row]
        // Check if the selected item has a storyboard name and identifier
        if let storyboardName = selectedItem.storyboard,
           let vc = selectedItem.vc {
            Navigation.navigateToOtherController(storyboardName, vc, from: self)
        }
    }
}
