//
//  MainDatasourceDelegate.swift
//  DhruvApp
//
//  Created by STTL on 18/04/24.
//


import Foundation
import UIKit

//Table View Delegate Protocol
protocol TblViewDelegate {
    func didselect(tbl: UITableView, indexPath: IndexPath)
}


class AboutCTUILDataSourceDelegate: NSObject {
    
    //Alias
    typealias T = AboutCTUILModel
    typealias tbl = UITableView
    typealias del = TblViewDelegate
    
    // Variables
    internal var arrSource: [T]
    internal var tblvw: tbl
    internal var delegate: del
    
    
    //MARK:- Initializers
    required init(arrData: [T], delegate: del, tbl: tbl) {
        arrSource = arrData
        tblvw = tbl
        self.delegate = delegate
        super.init()
        setupTbl()
    }
    
    //Setup Table Action
    fileprivate func setupTbl(){
        let nib = UINib(nibName: "CellTVC", bundle: nil)
        
        tblvw.register(nib, forCellReuseIdentifier: "CellTVC")
        tblvw.dataSource = self
        tblvw.delegate = self
        self.tblvw.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tblvw.reloadData()
        
    }
    
    //Reload Table Action
    func reload(arr:[T ]){
        arrSource = arr
        tblvw.reloadData()
        
    }
    
}

//MARK: - Extenstion of Class With UITableViewDelegate
extension AboutCTUILDataSourceDelegate:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didselect(tbl: tblvw, indexPath: indexPath)
    }
}

//MARK: - Extension of Class With UITableViewDataSource
extension AboutCTUILDataSourceDelegate:UITableViewDataSource
{
    //No. of Rows in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    //Values of Rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblvw.dequeueReusableCell(withIdentifier: "CellTVC", for: indexPath)as! CellTVC
        cell.configCell(data: arrSource[indexPath.row])
        return cell
    }
    
    
}


