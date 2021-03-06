//
//  FoodDetailsViewController.swift
//  ios_assignment_one
//
//  Created by Macbook on 3/6/21.
//

import UIKit

class FoodDetailsViewController: UIViewController {
    let fdb = db();
    
    var itemId:String = "";
    var foodName:String = "";
    var foodDesc:String = "";
    var price:String = "";
    var discount:String = "";
    var image:String = "";
 
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblDiscount: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblFoodName.text = foodName;
        lblDesc.text = foodDesc;
        lblPrice.text = "Rs. "+price;
        imgView.image = UIImage(named: image);
        lblDiscount.text = discount;
       
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnAddToCart(_ sender: Any) {
        //(mainChild:String,name:String,value:String)
    
        var data = fdb.SetValues();
        print(data);
        return;
        let cartItem = [
            [
                "itemId":itemId,
                "itemName":foodName,
                "qty":1
            ]
            
        ];
        
        cartItem.forEach{ (item)in
            fdb.Add(mainChild:"Cart",slot:itemId, qty: item)
        }
        
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
