//
//  FoodViewController.swift
//  testui
//
//  Created by Macbook on 2/28/21.
//

import UIKit

class FoodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tblFoodView: UITableView!
    @IBOutlet weak var tblFoodList: UITableView!
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
            "name":"Apple",
            "description":"lipsum as it is sometimes known",
            "price":"100.00",
            "discount":"30% OFF",
            "image":"hamburger.png"
            
        ],
        [
            "name":"Banana",
            "description":"lipsum as it is sometimes known",
            "price":"50.00",
            "discount":"5% OFF",
            "image":"banana.png"
        ],
        [
            "name":"Orange",
            "description":"lipsum as it is sometimes known",
            "price":"20.00",
            "discount":"30% OFF",
            "image":"orange.png"
        ],
        [
            "name":"Mango",
            "description":"lipsum as it is sometimes known",
            "price":"53.00",
            "discount":"7% OFF",
            "image":"hamburger.png"
        ],
        [
            "name":"Lemon",
            "description":"lipsum as it is sometimes known",
            "price":"100.00",
            "discount":"10% OFF",
            "image":"banana.png"
        ],
        [
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
       
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          print("You taped me");
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
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
            var imageName = foodsList[indexPath.row]["image"];
            cell.listItemImage.image = UIImage(named: imageName!);
            
             
            return cell
          }
        
        return UITableViewCell();
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartTableViewCell
//        cell.lblName.text = healthyFoods[indexPath.row]["name"];
//        cell.lblPrice.text = healthyFoods[indexPath.row]["price"];
//        return cell
    }
       
}


//      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = healthyFoods[indexPath.row]["price"];
//
//        return cell;
//      }



//extension ViewController:UITableViewDelegate{
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("You taped me");
//    }
//}
//extension ViewController:UITableViewDataSource{
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3;
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "Hellow World";
//        return cell;
//    }
//}
