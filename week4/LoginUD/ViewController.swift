//
//  ViewController.swift
//  LoginUD_hw8
//
//  Created by 이재용 on 11/23/23.
//

import UIKit



class ViewController: UIViewController {
    var id = String()
    var pw = String()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let loginDict : [String : String] = [:];
        
        UserDefaults.standard.set (loginDict, forKey : "loginDictKey")
    }
    
    
    //MARK: IBOutlet
    
    @IBOutlet weak var statement: UILabel!
    
    @IBOutlet weak var idField: UITextField!
    
    @IBOutlet weak var pwField: UITextField!
    
    
    
    //MARK: IBAction
    
    @IBAction func idTextField(_ sender: UITextField) {
        
        
        id = sender.text ?? ""
        print("id -> ",id)
        
        
        
    }
    
    @IBAction func pwTextField(_ sender: UITextField) {
        
        pw = sender.text ?? ""
        print ("pw -> ",pw)
        
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        print("login button tapped")
        var dict =  UserDefaults.standard.dictionary(forKey: "loginDictKey") as? [String : String]
        let id = idField.text!
        let pw = pwField.text!
        print (dict ?? "")
        
        if dict!.keys.contains(id){
            if(dict![idField.text!] == pwField.text){
                statement.text = "로그인 성공"
                if let loginVC = storyboard?.instantiateViewController(withIdentifier: "afterVC") as? AfterLoginView{
                    present(loginVC, animated: true , completion: nil)
                }
                
            }
            else{
                statement.text = "로그인 실패 비밀번호를 확인하세요"
            }
        }
        else {
            statement.text = "로그인 실패 올바른 아이디를 입력하세요"
        }
        
        
    }
    
    @IBAction func siginInButtonTapped(_ sender: UIButton) {
        print("Sign in button tapped")
        
        
        var dict =  UserDefaults.standard.dictionary(forKey: "loginDictKey")
        print (dict ?? "")
        
        if dict!.keys.contains(idField.text!){
            statement.text = "이미 존재하는 아이디입니다."
        }
        else {
            dict![idField.text!] = pwField.text
            UserDefaults.standard.set(dict, forKey: "loginDictKey")
            
            statement.text = "회원가입 완료"
        }
        
        idField.text = ""
        pwField.text = ""
    }
    
    
}

