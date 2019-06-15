//
//  ViewController.swift
//  mapView
//
//  Created by Cyber - Sahil Ratnani on 15/06/19.
//  Copyright © 2019 Concerge. All rights reserved.
//

import UIKit
import GoogleMaps

class DashboardVC: UIViewController {
    
    var mapView : GMSMapView!
    
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
         mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
    }
    
    func putMarker(locationData:[[String:String]]) {
        
        for location in locationData {
            // Creates a marker in the center of the map.
            let marker = GMSMarker()
            let lat = Double(location["lat"]!)
            let long = Double(location["long"]!)
            let camera = GMSCameraPosition.camera(withLatitude: lat!, longitude: long!, zoom: 6.0)
            
            marker.position = CLLocationCoordinate2D(latitude: lat! , longitude:long! )
            marker.title = location["city_name"]
            marker.map = mapView
            mapView.camera = camera
        }
       
        
    }

    func getData() {
        
        if let path = Bundle.main.path(forResource: "location", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                let decodedResponse = try? JSONDecoder().decode(Location.self, from: data)

                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! NSDictionary
                if let locationData = jsonResult["location"] as? [[String:String]] {
                   print("json fetched \(locationData)")
                    putMarker(locationData: locationData)
                }
//                print("json fetched \(decodedResponse)")

            } catch {
                print("fetching failed")
            }
        }
    }

}

