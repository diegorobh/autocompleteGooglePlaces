//
//  ViewController.swift
//  testAutocomplete
//
//  Created by imac on 24/04/19.
//  Copyright © 2019 imac. All rights reserved.
//

import UIKit
import GooglePlaces

class GetLocationController: UIViewController {
    
    //let locationManager = CLLocationManager()
    var placesClient: GMSPlacesClient!
    
    // Add a pair of UILabels in Interface Builder, and connect the outlets to these variables.
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // For getting the user permission to use location service when the app is running
        //locationManager.requestWhenInUseAuthorization()
        // For getting the user permission to use location service always
       // locationManager.requestAlwaysAuthorization()
        placesClient = GMSPlacesClient.shared()
    }
    
   

    
    
    // Add a UIButton in Interface Builder, and connect the action to this function.
    @IBAction func getCurrentPlace(_ sender: UIButton) {
        
        placesClient.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
            if let error = error {
                print("Current Place error: \(error.localizedDescription)")
                return
            }
            
            self.nameLabel.text = "No current place"
            self.addressLabel.text = ""
            
            if let placeLikelihoodList = placeLikelihoodList {
                let place = placeLikelihoodList.likelihoods.first?.place
                if let place = place {
                    self.nameLabel.text = place.name
                    self.addressLabel.text = place.formattedAddress?.components(separatedBy: ", ")
                        .joined(separator: "\n")
                }
            }
        })
    }

}

