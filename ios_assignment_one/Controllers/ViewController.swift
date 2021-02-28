//
//  ViewController.swift
//  testui
//
//  Created by Macbook on 2/14/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPwd: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        initUiChanges();
    }
    
    func initUiChanges(){
        btnLogin.layer.cornerRadius = 17;
    }
    
    
    @IBAction func login(_ sender: Any) {
        
        var username = "nipun";
        var password = "123456"
        
      //  if username == txtUsername.text && password == txtPwd.text {
            
    performSegue(withIdentifier: "signintosignupa", sender: nil)
        
//            let alert = UIAlertController(title: "Alert", message: "Login Successfull", preferredStyle: UIAlertController.Style.alert)
//            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//        }
//        else
//        {
//            print("Username and password not matched!")
//        }
        
        
        print(txtUsername.text ?? 0);
    }
    

}

