//
//  orderVIewController.swift
//  beaMin_datasending
//
//  Created by 이재용 on 11/10/23.
//

import UIKit




class  orderViewController : UIViewController, UITableViewDataSource , UITableViewDelegate{
    var receivedMenuSaves : [MenuSave] = []
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 171
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 여기에 테이블 뷰의 섹션당 행의 수를 반환하는 코드를 작성합니다.
        return receivedMenuSaves.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! CustomTableViewCell
        let menuSave = receivedMenuSaves[indexPath.row]
        // 필수 메뉴 정보
            var displayText = "- 필수 메뉴: \(menuSave.neededOption_name) (\(menuSave.neededOption_price)원)"
            
            // 선택된 추가 메뉴 정보
            for (index, optionName) in menuSave.selectedOptions_name.enumerated() {
                let optionPrice = menuSave.selectedOptions_price[index]
                displayText += "\n - 추가메뉴 \(index + 1): \(optionName) (+\(optionPrice)원)"
            }

            cell.MenuAndPrice.text = displayText
            
            // 총 가격 계산
            let totalOfCell = menuSave.neededOption_price + menuSave.selectedOptions_price.reduce(0, +)
            cell.TotalOfCell.text = "총합: \(totalOfCell)원"
            
            // numOfUnits 설정
            cell.numOfUnits.text = "1"

            return cell
        // 여기에 각 셀의 내용을 구성하는 코드를 작성합니다.
        
    }

    
    
    
    
    @IBOutlet weak var MenuTable: UITableView!
    @IBOutlet weak var RealTotalPrice: UILabel!
    @IBOutlet weak var numOfAllOrders: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MenuTable.dataSource = self
        MenuTable.delegate = self
        print("Here is Struct Arr -> \n",receivedMenuSaves)
    }
    
    
}
