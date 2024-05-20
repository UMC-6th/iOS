//
//  ViewController.swift
//  beaMin_datasending
//
//  Created by 이재용 on 11/10/23.
//

import UIKit



class ViewController: UIViewController {
    
    //MARK: - variables
    var menuSaves: [MenuSave] = []
    var menuSave_Unit = MenuSave(neededOption_name: "", neededOption_price: 0, selectedOptions_name: [], selectedOptions_price: [])
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UpdatesOrderButton()
    }
// MARK: - IBOutlets

    
    @IBOutlet weak var orderButton: UIButton!
    
    @IBOutlet weak var radioButton1: RadioButton!
    @IBOutlet weak var radioButton2: RadioButton!
    
    @IBOutlet weak var Checkbox1: CheckBox!
    @IBOutlet weak var CheckBox2: CheckBox!
    
    @IBOutlet weak var CheckBox3: CheckBox!
    @IBOutlet weak var CheckBox4: CheckBox!
    
    
    
    @IBOutlet weak var FirstNeededOptionName: UILabel!
    @IBOutlet weak var FirstNeededOptionPrice: UILabel!
    @IBOutlet weak var SecondNeededOptionName: UILabel!
    @IBOutlet weak var SecondNeededOptionPrice: UILabel!
    
    @IBOutlet weak var CheckBox1_Name: UILabel!
    @IBOutlet weak var CheckBox1_Price: UILabel!
    
    @IBOutlet weak var CheckBox2_Name: UILabel!
    @IBOutlet weak var CheckBox2_Price: UILabel!
    
    @IBOutlet weak var CheckBox3_Name: UILabel!
    @IBOutlet weak var CheckBox3_Price: UILabel!
    
    @IBOutlet weak var CheckBox4_Name: UILabel!
    @IBOutlet weak var CheckBox4_Price: UILabel!
    
    // MARK: - ETC Funcs
    func UpdatesOrderButton (){
        var summedPrice : Int = 0
        
        for price in menuSave_Unit.selectedOptions_price{
            summedPrice += price
        }
        summedPrice += menuSave_Unit.neededOption_price
        
        
        orderButton.setTitle("\(summedPrice)원", for: .normal)

    }
    
    
    
    
    
    
    // MARK: - IBActions
    
    @IBAction func radioButtonTapped(_ sender: RadioButton) {
        var name : String
        var price : Int
        var strPrice : String
        
        let buttons = [radioButton1, radioButton2]
            buttons.forEach { $0?.isChecked = false }
        sender.isChecked = true

            
       
        if sender == radioButton1 {
            name = FirstNeededOptionName.text ?? ""
            strPrice = FirstNeededOptionPrice.text ?? ""
            price = Int(strPrice.filter{ "01234567890".contains($0)}) ?? 0
            menuSave_Unit.neededOption_name = name
            menuSave_Unit.neededOption_price = price
            

        } else if sender == radioButton2 {
            name = SecondNeededOptionName.text ?? ""
            strPrice = SecondNeededOptionPrice.text ?? ""
            price = Int(strPrice.filter{ "01234567890".contains($0)}) ?? 0
            menuSave_Unit.neededOption_name = name
            menuSave_Unit.neededOption_price = price
        }
        
        print("menuSave_Unit 상태: \(String(describing: menuSave_Unit))")
        UpdatesOrderButton()
    }
    
   
    @IBAction func cboxIsTapped(_ sender: CheckBox) {
        print("func on")
        if(sender.isChecked == true){
            sender.isChecked = false
        }
        else {sender.isChecked = true}
        var name: String
        var price: Int = 0
        var strprice: String

        switch sender.tag {
        case 0...3:
            print("tag \(sender.tag)")
            switch sender.tag {
            case 0:
                name = CheckBox1_Name.text ?? ""
                strprice = CheckBox1_Price.text ?? ""
            case 1:
                name = CheckBox2_Name.text ?? ""
                strprice = CheckBox2_Price.text ?? ""
            case 2:
                name = CheckBox3_Name.text ?? ""
                strprice = CheckBox3_Price.text ?? ""
            case 3:
                name = CheckBox4_Name.text ?? ""
                strprice = CheckBox4_Price.text ?? ""
            default:
                return
            }

            let filteredString = strprice.filter { "0123456789".contains($0) }
            if let number = Int(filteredString) {
                price = number
                print(price)
            } else {
                print("가격 변환 실패")
                return
            }

            // MenuSave_Unit 업데이트
            if sender.isChecked {
                // 체크박스가 선택된 경우
                if menuSave_Unit.selectedOptions_name.count <= sender.tag {
                    // 배열의 크기를 확장
                    menuSave_Unit.selectedOptions_name.append(contentsOf: Array(repeating: "", count: sender.tag + 1 - (menuSave_Unit.selectedOptions_name.count )))
                    menuSave_Unit.selectedOptions_price.append(contentsOf: Array(repeating: 0, count: sender.tag + 1 - (menuSave_Unit.selectedOptions_price.count )))
                }
                // 값을 추가하거나 업데이트
                menuSave_Unit.selectedOptions_name[sender.tag] = name
                menuSave_Unit.selectedOptions_price[sender.tag] = price
            } else {
                // 체크박스가 해제된 경우
                if menuSave_Unit.selectedOptions_name.count > sender.tag {
                    menuSave_Unit.selectedOptions_name[sender.tag] = ""
                    menuSave_Unit.selectedOptions_price[sender.tag] = 0
                }
            }

        default:
            return
            
            
        }
        print("menuSave_Unit 상태: \(String(describing: menuSave_Unit))")
        print ("cbox func end")
        UpdatesOrderButton()
    }

       
    
    
    @IBAction func orderButtonDidTap(_ sender: UIButton) {
        print("menuSave_Unit 상태: \(String(describing: menuSave_Unit))")
        menuSaves.append(menuSave_Unit)
            menuSave_Unit = MenuSave(neededOption_name: "", neededOption_price: 0, selectedOptions_name: [], selectedOptions_price: [])
        
        
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let orderVC = storyboard.instantiateViewController(withIdentifier: "OrderView") as? orderViewController {
                orderVC.receivedMenuSaves = menuSaves
                self.navigationController?.pushViewController(orderVC, animated: true)
            }
        
    }
    
}

