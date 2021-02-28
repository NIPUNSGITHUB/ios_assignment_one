//
//  FoodViewController.swift
//  testui
//
//  Created by Macbook on 2/28/21.
//

import UIKit

class FoodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tblFoodView: UITableView!
    
    let healthyFoods = ["Apple", "Orange", "Pear", "Grapefruit", "Potato", "Tomato", "Leek", "Tangerine"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblFoodView.delegate = self;
        tblFoodView.dataSource = self;
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          print("You taped me");
      }
      
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return healthyFoods.count;
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = healthyFoods[indexPath.row];
        return cell;
      }
  
    
}

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
