//
//  OrderMenuVC.swift
//  StarbucksMock3
//
//  Created by Jaeho Jung on 2022/11/16.
//
//Hide tab bar in IOS swift app: https://stackoverflow.com/questions/28777943/hide-tab-bar-in-ios-swift-app


import UIKit

class OrderMenuVC: UIViewController {

    // MARK: - Variables
    var detailTableViewData = [[String]]()

    // MARK: - IBOutlet
    @IBOutlet weak var orderMenuTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("OrderMenuVC: \(detailTableViewData)")
        
        self.tabBarController?.tabBar.isHidden = true
        
        let cellNib = UINib(nibName: "OrderMenuTableViewCell", bundle: nil)
        orderMenuTableView.register(cellNib, forCellReuseIdentifier: "OrderMenuTableViewCell")
        
    }
}

// MARK: - UITableViewDelegate
extension OrderMenuVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        print(detailTableViewData[indexPath.row])
        
        performSegue(withIdentifier: "showDetailMenuDetail", sender: indexPath.row)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailMenuDetail" {
            let vc = segue.destination as? showDetailMenuDetail
            if let index = sender as? Int {
                vc?.selectedMenuData = detailTableViewData[index]

//                print("This\(detailTableViewData[index])")
//                print("This\(detailTableViewData[index][0])")
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension OrderMenuVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        print(detailTableViewData.count)
        return detailTableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderMenuTableViewCell") as! OrderMenuTableViewCell
        
        cell.orderMenuNameKorean.text = detailTableViewData[indexPath.row][0]
        cell.orderMenuNameEnglish.text = detailTableViewData[indexPath.row][1]
        
        let price = Int(detailTableViewData[indexPath.row][2])?.withCommas()
//        print(price!)
        cell.orderMenuPrice.text = "\(price!)원"
        
        return cell
    }
}

// MARK: - extension for Price Display Format
extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}




