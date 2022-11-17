//
//  OrderVC.swift
//  StarbucksMock3
//
//  Created by Jaeho Jung on 2022/11/16.
//

import UIKit

class OrderVC: UIViewController {
    
    var tableViewData = [MenuData]()
    
    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = [
                        MenuData(Menu: "리저브 에스프레소", MenuDetail: [["크리스마스 클래식 민트 모카", "Christmas Classic Mint Mocha", "10,000", "Flavor  Note 스타벅스의 클래식인 페퍼핌트 모카를 떠올리게 하는 리저브만의 에스프레소 음료 오트 밀크의 고소함과 다크 초콜릿의 쌉쌀함이 특징인 음료. 한정 기간에만 제공되는 크리스마스 원두로 즐겨 보세요."], ["르완다 S 클래식 민트 모카", "Rewanda S Classic Mint Mocha", "10,000", "Flavor  Note 스타벅스의 클래식인 페퍼핌트 모카를 떠올리게 하는 리저브만의 에스프레소 음료 오트 밀크의 고소함과 다크 초콜릿의 쌉쌀함이 특징인 음료. 한정 기간에만 제공되는 르완다 쇼리 원두로 즐겨 보세요."], ["클래식 민트 모카", "Mint Mocha", "8,000", "Flavor  Note 스타벅스의클ㄹ래식인 페퍼핌트 모카를 떠올리게 하는 리저브만의 에스프레소 음료 오트 밀크의 고소함과 다크 초콜릿의 쌉쌀함이 특징인 음료."]]),
                        MenuData(Menu: "리저브 드립", MenuDetail: [["민트 콜드 브루", "Mint Cold Brew", "8,000", "Flavor  Note 상쾌한 민트향 시럽과 잘게 갈린 어름이 어우러져 시원함이 강렬하게 느껴지는 리저브만의 클드 브루 음료"], ["리저브 나이트로", "Reserve Nitro", "7,500", "Flavor  Note 나이트로 커피 정통의 캐스케이딩과 부드러운 콜드 크레마! 부드러운 목 넘김과 완벽한 밸런스에 커피 본연의 단맛을 경험할 수 있습니다."], ["콜드 브루 몰트", "Cold Brew Malt", "8,500", "Flavor  Note [리저브 전용음료] 리저브 콜드 브루, 바닐라 아이스크림, 몰트가 블렌딩된 리저브만의 쉐이크"]]),
                        MenuData(Menu: "리프레셔", MenuDetail: [["딸기 아사이 레모네이드 스타벅스 리프레셔", "Strawbery Acai with Lemonade Startbucks Refresher", "5,900", "딸기, 아사이베리 주스와 레모네이드가 달콤 상큼하게 조화된 맛에 가볍게 에너지 부스팅을 할 수 있는 리프레셔 음료"], ["핑크 드링크 위드 딸기 아사이 스타벅스 리스레셔", "Pink Drink with Strawberry Acai Starbucks Refresher", "5,900", "딸기, 아사이베리 주스와 코코넛 밀크가 달콤하고 부드럽게 조화된 맛에 가볍게 에너지 부스팅을 할 수 있는 리프레셔 음료"]]),
                        MenuData(Menu: "리저브 에스프레소", MenuDetail: [["크리스마스 클래식 민트 모카", "Christmas Classic Mint Mocha", "10,000", "Flavor  Note"], ["르완다 S 클래식 민트 모카", "Rewanda S Classic Mint Mocha", "10,000", "Flavor  Note"], ["클래식 민트 모카", "Mint Mocha", "8,000", "Flavor  Note"]]),
                        MenuData(Menu: "리저브 드립", MenuDetail: [["민트 콜드 브루", "Mint Cold Brew", "8,000", "Flavor  Note"], ["리저브 나이트로", "Reserve Nitro", "7,500", "Flavor  Note"], ["콜드 브루 몰트", "Cold Brew Malt", "8,500", "Flavor  Note"]]),
                        MenuData(Menu: "리프레셔", MenuDetail: [["딸기 아사이 레모네이드 스타벅스 리프레셔", "Strawbery Acai with Lemonade Startbucks Refresher", "5,900", "Flavor  Note"], ["핑크 드링크 위드 딸기 아사이 스타벅스 리스레셔", "Pink Drink with Strawberry Acai Starbucks Refresher", "5,900", "Flavor  Note"], ["클래식 민트 모카", "Mint Mocha", "8,000", "Flavor  Note"]])
        ]

    
        let cellNib = UINib(nibName: "MenuTableViewCell", bundle: nil)
        menuTableView.register(cellNib, forCellReuseIdentifier: "MenuTableViewCell")

    }
}

extension OrderVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

//        let menuName = tableViewData[indexPath.row].Menu
//        print(menuName)
        
        performSegue(withIdentifier: "showDetailMenu", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailMenu" {
            let vc = segue.destination as? OrderMenuVC
            if let index = sender as? Int {
//                print(tableViewData[index].MenuDetail)
                vc?.detailTableViewData = tableViewData[index].MenuDetail
            }
        }
    }
}
    

extension OrderVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        cell.menuNameKorean.text = tableViewData[indexPath.row].Menu
        return cell
    }
}



