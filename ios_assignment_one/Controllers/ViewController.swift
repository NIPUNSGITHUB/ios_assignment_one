//
//  ViewController.swift
//  testui
//
//  Created by Macbook on 2/14/21.
//

import UIKit

class ViewController: UIViewController {
    var username = "nipun";
    var password = "123456"
    var msg = "";
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPwd: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        initUiChanges();
       
    }
    
    func initUiChanges(){
        btnLogin.layer.cornerRadius = 17;
        txtUsername.text = username
        txtPwd.text = password
    }
    
    
    @IBAction func login(_ sender: Any) {
         
        if txtUsername.text == ""
        {
            msg = "Please enter your username";
            alert(msg: msg);
           
        }
        else if txtPwd.text == ""
        {
            msg = "Please enter your password";
            alert(msg: msg);
            
        }
        else
        {
            
           if username == txtUsername.text && password == txtPwd.text {
            
            performSegue(withIdentifier: "signintohome", sender: nil)
            
            }
            else
           {
                var msg = "Invalid credentials";
                alert(msg: msg);

           }
        }
        //Username and password not matched!
        print(txtUsername.text ?? 0);
    }
    
    
    func alert(msg:String) {
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

