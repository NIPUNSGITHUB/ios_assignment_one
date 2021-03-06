//
//  db.swift
//  ios_assignment_one
//
//  Created by Macbook on 3/6/21.
//

import Foundation
import Firebase
var cartItems:[String]=[]
public class db: NSObject {

    private let context=Database.database().reference()
    override init() {
//        self.context.child("itemlist").child("item1").child("name").setValue("Apple");
//        self.context.child("itemlist").child("item1").child("description").setValue("lipsum as it is sometimes known");
//        self.context.child("itemlist").child("item1").child("price").setValue("100.00");
//        self.context.child("itemlist").child("item1").child("discount").setValue("30% OFF");
//        self.context.child("itemlist").child("item1").child("image").setValue("hamburger.png");
//
//        self.context.child("itemlist").child("item2").child("name").setValue("Banana");
//        self.context.child("itemlist").child("item2").child("description").setValue("lipsum as it is sometimes known");
//        self.context.child("itemlist").child("item2").child("price").setValue("100.00");
//        self.context.child("itemlist").child("item2").child("discount").setValue("5% OFF");
//        self.context.child("itemlist").child("item2").child("image").setValue("banana.png");
    }
    
//    func configure()
//    {
//        FirebaseApp.configure()
//    }
//
//    func setReference()
//    {
//
//
//        print("ABC")
//    }
    
    func Add(mainChild:String,slot:String,qty:Any) {
        self.context.child(mainChild).child(slot).setValue(qty);
    }
    
    func SetValues()  {
        
       
        
       self.context.child("Cart").getData{ (error, snapshot) in
        let dt=snapshot.value as! [String:AnyObject]
      
        dt.forEach({(key,val) in
            let cart=ItemCart(name: val["name"] as! String, description:  val["description"] as! String, price:  val["price"] as! String, discount:  val["discount"] as! String, image:  val["image"] as! String)
            cartItems.append(val as! String)
        })
        
       // return a as! [String]
    }
    
    
    
  
}
}
