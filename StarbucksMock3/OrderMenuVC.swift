//
//  OrderMenuVC.swift
//  StarbucksMock3
//
//  Created by Jaeho Jung on 2022/11/16.
//

import UIKit

class OrderMenuVC: UIViewController {

    @IBOutlet weak var orderMenuTableView: UITableView!
    
    var detailTableViewData = [[String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(detailTableViewData)
        
        self.tabBarController?.tabBar.isHidden = true
        
        let cellNib = UINib(nibName: "OrderMenuTableViewCell", bundle: nil)
        orderMenuTableView.register(cellNib, forCellReuseIdentifier: "OrderMenuTableViewCell")
        
    }
}

extension OrderMenuVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(detailTableViewData[indexPath.row])
        
        performSegue(withIdentifier: "showDetailMenuDetail", sender: indexPath.row)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailMenuDetail" {
            let vc = segue.destination as? showDetailMenuDetail
            if let index = sender as? Int {
                print("This\(detailTableViewData[index])")
                print("This\(detailTableViewData[index][0])")
//                vc?.drinkNameKorean.text = detailTableViewData[index][0]
//                vc?.drinkNameEnglish.text = detailTableViewData[index][1]
//                vc?.drinkDescription.text = detailTableViewData[index][3]
//                vc?.drinkDescription.text = detailTableViewData[index][2]
                
                
//                vc?.detailTableViewData = tableViewData[index].MenuDetail
            }
        }
    }
}


extension OrderMenuVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(detailTableViewData.count)
        return detailTableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderMenuTableViewCell") as! OrderMenuTableViewCell
        
        cell.orderMenuNameKorean.text = detailTableViewData[indexPath.row][0]
        cell.orderMenuNameEnglish.text = detailTableViewData[indexPath.row][1]
        cell.orderMenuPrice.text = detailTableViewData[indexPath.row][2]
        
        return cell
    }
}






