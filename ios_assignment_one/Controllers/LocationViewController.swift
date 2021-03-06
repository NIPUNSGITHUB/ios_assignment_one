//
//  LocationViewController.swift
//  testui
//
//  Created by Macbook on 2/28/21.
//

import UIKit
import CoreLocation
class LocationViewController: UIViewController , CLLocationManagerDelegate{

    @IBOutlet weak var btnAlowLocation: UIButton!
    var lc:CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAlowLocation.layer.cornerRadius = 17;
        lc=CLLocationManager()
        lc?.delegate=self
        lc?.requestAlwaysAuthorization()
        
        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeacon.self){
                if CLLocationManager.isRangingAvailable(){
                    
                }
            }
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
