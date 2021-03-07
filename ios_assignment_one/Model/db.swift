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
    
    lazy var background :DispatchQueue = {
        return DispatchQueue.init(label: "background.queue",attributes: .concurrent)
    }()
    public let context = Database.database().reference()
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
    func setReference(carts:Cart)
    {
        print(carts)
    }
    
    func Add(mainChild:String,slot:String,qty:Any) {
        self.context.child(mainChild).child(slot).setValue(qty);
    }
    
    func getData() {
        var cart:Cart!; 
        self.background.async {
            let group = DispatchGroup.init();
            group.enter()
            let ref = self.context.database.reference(withPath: "Cart");
            ref.observe(.childAdded) { (snap) in


                snap.ref.removeAllObservers();
                do {
                    
                    //guard let dict = snap.value as? NSDictionary else {return}
                    let data = try! JSONSerialization.data(withJSONObject: snap.value as? NSDictionary, options: .prettyPrinted)
                    cart = try! JSONDecoder.init().decode(Cart.self, from: data)

                    group.leave()
                }

            }
            group.wait()

            print(cart ?? "no")
        }
    }
    
//    func SetValues(completion: @escaping ([Cart]) -> Void){
//
//        self.context.child("Cart").getData{ (error, snapshot) in
//
//            if let error = error {
//                  print(error)
//                  completion(self.itemCart)
//                  return
//                }
//            else
//            {
//                let dt=snapshot.value as! [String:AnyObject]
//                dt.forEach({(key,val) in
//                    let cart = Cart(itemId:val["itemId"] as? String, itemName: val["itemName"] as? String, qty:val["qty"] as? String)
//                    self.itemCart.append(cart)
//                });
//
//                completion(self.itemCart)
//            }
//
//       }
        
 //   }
}
