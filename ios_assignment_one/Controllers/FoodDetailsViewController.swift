//
//  FoodDetailsViewController.swift
//  ios_assignment_one
//
//  Created by Macbook on 3/6/21.
//

import UIKit
import Firebase
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
        var cart:Cart!;
        // let ref = fdb.context.database.reference(withPath: "Cart");
      
        
        fdb.context.child("Cart").child(itemId).getData{ [self] (error, snapshot) in
            if let error = error {
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                print("Item Already Available in Firebase" )
                print(snapshot.value)
            }
            else {

                addToCart();
                print("No data available")
            }
        }
    }
        
    func addToCart()
    {
       let cartItem = [
           [
               "itemId":itemId,
               "itemName":foodName,
               "qty":1
           ]

       ];
       
       cartItem.forEach{ (item) in
           fdb.Add(mainChild:"Cart",slot:itemId, qty: item)
       }
    }
    
   

}


