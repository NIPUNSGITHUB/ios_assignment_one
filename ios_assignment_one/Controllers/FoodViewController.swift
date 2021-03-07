//
//  FoodViewController.swift
//  testui
//
//  Created by Macbook on 2/28/21.
//

import UIKit
import Firebase
class FoodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    let fdb = db()
    var cart = Cart();
   
    @IBOutlet weak var lblItemCount: UILabel!
    @IBOutlet weak var tblFoodView: UITableView!
    @IBOutlet weak var tblFoodList: UITableView!
    var itemIndexPath = 0;
    //let healthyFoods = ["Apple", "Orange", "Pear", "Grapefruit", "Potato", "Tomato", "Leek", "Tangerine"]
    let healthyFoods = [
        [
            "name":"Apple",
            "price":"100.00"
        ],
        [
            "name":"Orange",
            "price":"50.00"
        ],
        [
            "name":"Pear",
            "price":"60.00"
        ],
        [
            "name":"Grapefruit",
            "price":"100.00"
        ],
        [
            "name":"Potato",
            "price":"30.00"
        ],
        [
            "name":"Tomato",
            "price":"40.00"
        ]
        
    ];
    
    let foodsList = [
        [
            "id":"1",
            "name":"Apple",
            "description":"lipsum as it is sometimes known",
            "price":"100.00",
            "discount":"30% OFF",
            "image":"hamburger.png"
            
        ],
        [
            "id":"2",
            "name":"Banana",
            "description":"lipsum as it is sometimes known",
            "price":"50.00",
            "discount":"5% OFF",
            "image":"banana.png"
        ],
        [
            "id":"3",
            "name":"Orange",
            "description":"lipsum as it is sometimes known",
            "price":"20.00",
            "discount":"30% OFF",
            "image":"orange.png"
        ],
        [
            "id":"4",
            "name":"Mango",
            "description":"lipsum as it is sometimes known",
            "price":"53.00",
            "discount":"7% OFF",
            "image":"hamburger.png"
        ],
        [
            "id":"5",
            "name":"Lemon",
            "description":"lipsum as it is sometimes known",
            "price":"100.00",
            "discount":"10% OFF",
            "image":"banana.png"
        ],
        [
            "id":"6",
            "name":"Avacardo",
            "description":"lipsum as it is sometimes known",
            "price":"100.00",
            "discount":"20% OFF",
            "image":"orange.png"
        ]

        
    ];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblFoodView.delegate = self;
        tblFoodView.dataSource = self;
        tblFoodList.delegate = self;
        tblFoodList.dataSource = self;
        getCurrentCartItems();
     }
    
    func getCurrentCartItems() {
        fdb.context.child("Cart").getData { (error, snapshot) in
            if let error = error {
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                for item in snapshot.children{
                    
                }
            }
            else {
                print("No data available")
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        
        if tableView == tblFoodList
        {
            itemIndexPath = indexPath.row;
            performSegue(withIdentifier: "listtodetails", sender: self)
            print(itemIndexPath)

        }
      }
      
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            if tableView == tblFoodView
            {
                return healthyFoods.count;
            }
               
            else if tableView == tblFoodList
            {
                return foodsList.count
            }
        
        return section;
      }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let foodDetails = segue.destination as! FoodDetailsViewController;
        let item = foodsList[itemIndexPath];
        foodDetails.itemId = String(item["id"] ?? "null");
        foodDetails.foodName = String(item["name"] ?? "null");
        foodDetails.foodDesc = String(item["description"] ?? "..");
        foodDetails.price = String(item["price"] ?? "..");
        foodDetails.discount = String(item["discount"] ?? "..");
        foodDetails.image = String(item["image"] ?? "..");
       
    }
   
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        lblItemCount.text = String(healthyFoods.count)+" Items";
        if tableView == tblFoodView,
              let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CartTableViewCell {
             
                cell.lblName.text = healthyFoods[indexPath.row]["name"];
                cell.lblPrice.text = healthyFoods[indexPath.row]["price"];
                
              return cell
          } else if tableView == tblFoodList,
              let cell = tableView.dequeueReusableCell(withIdentifier: "foodListItem") as? FoodListTableViewCell {
            cell.lblFoodName.text =  foodsList[indexPath.row]["name"];
            cell.lblFoodPrice.text =  foodsList[indexPath.row]["price"];
            cell.lblFoodDescription.text =  foodsList[indexPath.row]["description"];
            cell.lblDiscount.text =  foodsList[indexPath.row]["discount"];
            let imageName = foodsList[indexPath.row]["image"];
            cell.listItemImage.image = UIImage(named: imageName!);
            
             
            return cell
          }
        
        return UITableViewCell();
    }
    
    
}
 
