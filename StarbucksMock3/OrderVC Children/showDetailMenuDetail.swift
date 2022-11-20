//
//  showDetailMenuDetail.swift
//  StarbucksMock3
//
//  Created by Jaeho Jung on 2022/11/18.
//

import UIKit

//protocol PassSelectedMenuData {
//    func passData(menuInfo: [String])
//}

class showDetailMenuDetail: UIViewController {

    // MARK: - Variables
    var selectedMenuData = [String]()
    
//    var data: [String] = []
//    var delegate: PassSelectedMenuData!

    // MARK: - IBOutlet
    @IBOutlet weak var drinkImage: UIView!
    @IBOutlet weak var drinkNameKorean: UILabel!
    @IBOutlet weak var drinkNameEnglish: UILabel!
    @IBOutlet weak var drinkDescription: UILabel!
    @IBOutlet weak var drinkPrice: UILabel!
    @IBOutlet weak var drinkHotColdChoiceSegment: UISegmentedControl!
    @IBOutlet weak var NutritionInfo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        data = selectedMenuData

        
//        print("selectedMenuData\(selectedMenuData)")


        drinkNameKorean.text = selectedMenuData[0]
        drinkNameEnglish.text = selectedMenuData[1]
        drinkDescription.text = selectedMenuData[3]
        
        let price = Int(selectedMenuData[2])?.withCommas()
//        print(price!)
        drinkPrice.text = "\(price!)원"
    }
    
    // MARK: - IBAction
    @IBAction func buttonTapped(_ sender: UIButton) {
        
//        print("selectedMenuData\(selectedMenuData)")
//        delegate.passData(menuInfo: data)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "placeOrder" {
            let vc = segue.destination as? PlaceOrderVC
            vc?.orderData = selectedMenuData
        }
    }
    
}
