//
//  PlaceOrderVC.swift
//  StarbucksMock3
//
//  Created by Jaeho Jung on 2022/11/18.
//

import UIKit

class PlaceOrderVC: UIViewController {
    
    var orderData = [String]()
    var price: String = ""
    public var totalPrice: Int = 0
    
    @IBOutlet weak var menuName: UILabel!
    
    @IBOutlet weak var showNumberOfCups: UILabel!
    @IBOutlet weak var showPrice: UILabel!
    
    var counter = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("PlaceOrderVC\(orderData)")
        menuName.text = orderData[0]

        price = (Int(orderData[2])?.withCommas())!
//        print(price)
        showPrice.text = "\(price)원"

    }
    
    @IBAction func addOne() {
        counter = counter + 1
        showNumberOfCups.text = String(counter)
        totalPrice = Int(orderData[2])! * counter
//        let totalPrice = Int(orderData[2])! * counter
//        print(totalPrice)
        showPrice.text = "\(totalPrice.withCommas())원"
//        showNumberOfCups.text = String(counter * Int(orderData[2])!)
    }
    
    @IBAction func minueOne() {
        if counter > 1 {
            counter = counter - 1
            let totalPrice = Int(orderData[2])! * counter
            showPrice.text = "\(totalPrice.withCommas())원"

        } else {
            showNumberOfCups.text = String("1")
            showPrice.text = "\((Int(orderData[2])?.withCommas())!)원"
        }
    }
    
    
    @IBAction func addToFavorite(_ sender: UIButton) {
    }

    @IBAction func addToCart(_ sender: UIButton) {
    }
    
    @IBAction func placeOrder(_ sender: UIButton) {
        
        for _ in 1...counter {
            selectedMenu.append(orderData)
        }
        print(selectedMenu)
        print(selectedMenu.count)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pamentSegue" {
            let vc = segue.destination as? PaymentVC
            vc?.priceBeforeDiscount = totalPrice
        }
    }
}

//
//extension PlaceOrderVC: PassSelectedMenuData {
//    func passData(menuInfo: [String]) {
//        orderData = menuInfo
//        print("orderData:\(orderData)")
//    }
//}




