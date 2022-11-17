//
//  showDetailMenuDetail.swift
//  StarbucksMock3
//
//  Created by Jaeho Jung on 2022/11/18.
//

import UIKit

class showDetailMenuDetail: UIViewController {

    @IBOutlet weak var drinkImage: UIView!
    @IBOutlet weak var drinkNameKorean: UILabel!
    @IBOutlet weak var drinkNameEnglish: UILabel!
    @IBOutlet weak var drinkDescription: UILabel!
    @IBOutlet weak var drinkPrice: UILabel!
    @IBOutlet weak var drinkHotColdChoiceSegment: UISegmentedControl!
    @IBOutlet weak var NutritionInfo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
