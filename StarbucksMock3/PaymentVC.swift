//
//  PaymentVC.swift
//  StarbucksMock3
//
//  Created by Jaeho Jung on 2022/11/20.
//
// Expanding Table View Cells! (Swift 4 in Xcode): https://www.youtube.com/watch?v=ClrSpJ3txAs

import UIKit

struct cellData {
    var opened = Bool()
    var title = String()
    var cellDetailedData = [String]()
}

class PaymentVC: UIViewController {
    
    var paymentTableViewData = [cellData]()
    var priceBeforeDiscount: Int = 0

    @IBOutlet weak var paymentTableView: UITableView!
    @IBOutlet weak var selectedMenuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .purple
        print(selectedMenu)
        paymentTableViewData = [cellData(opened: false, title: "결제 수단", cellDetailedData: ["신용카드", "SSGPAY"]),
                                cellData(opened: false, title: "쿠폰 및 할인", cellDetailedData: ["쿠폰", "선물", "통신사 제휴 할인"])]
    
    }


    // MARK: - Navigation
    
    
}

extension PaymentVC: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if paymentTableViewData[indexPath.section].opened == true {
            paymentTableViewData[indexPath.section].opened = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        } else {
            paymentTableViewData[indexPath.section].opened = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }
    }
}

extension PaymentVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView.tag == 1 {
            return 40
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView.tag == 1 {
            return "주문내역"
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if tableView.tag == 1 {
            return 80
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if tableView.tag == 1 {
//            totalprice
//            return "주문 금액 \()원"
            
            let displaypriceBeforeDiscount = priceBeforeDiscount.withCommas()
            return "test. \(displaypriceBeforeDiscount)원"
        } else {
            return nil
        }
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if tableView.tag == 0 {
            return paymentTableViewData.count

        } else {
            return 1
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView.tag == 0 {
            if paymentTableViewData[section].opened == true {
                return paymentTableViewData[section].cellDetailedData.count + 1
            } else {
                return 1
            }
        } else {
            return selectedMenu.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView.tag == 0 {
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell()}
                cell.textLabel?.text = paymentTableViewData[indexPath.section].title
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell()}
                cell.textLabel?.text = paymentTableViewData[indexPath.section].cellDetailedData[indexPath.row - 1]
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "selectedMenuCell")
            cell?.textLabel?.text = selectedMenu[indexPath.row][0]
            return cell ?? UITableViewCell()
        }
    }
}


