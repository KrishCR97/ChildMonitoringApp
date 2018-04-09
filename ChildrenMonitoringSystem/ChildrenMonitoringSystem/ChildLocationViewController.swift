//
//  ChildLocationViewController.swift
//  ChildrenMonitoringSystem
//
//  Created by student on 3/12/18.
//

import UIKit
import MapKit
import CoreLocation

class ChildLocationViewController : UIViewController,CLLocationManagerDelegate {
    @IBOutlet weak var mapOutlet: MKMapView!
    let locationManagerInstance = CLLocationManager()
    let chLocation : ChildLocation = ChildLocation()
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let span : MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let currentLocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region : MKCoordinateRegion = MKCoordinateRegion(center: currentLocation, span: span)
        mapOutlet.setRegion(region, animated: true)
        self.mapOutlet.showsUserLocation = true
        print("Latitude is : \(location.coordinate.latitude)")
        print("Longitude is : \(location.coordinate.longitude)")
        print(location.speed)
        chLocation.childID = AppDelegate.childID
        getLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        //chLocation.childLocationInfo = "Maryville"
        chLocation.latitude = "\(location.coordinate.latitude)"
        chLocation.longitude = "\(location.coordinate.longitude)"
    AppDelegate.DBInstance.backendless.data.of(ChildLocation.self).save(chLocation , response: { (result : (Any?)) -> Void  in
            let child = result as! ChildLocation;
            print("\(String(describing: child.latitude))")
            print("\(String(describing: result))")
        },
                                                                       error: { ( fault : Fault?) -> () in
                                                                        print("Server reported an error: \(String(describing: fault))")
        })
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManagerInstance.delegate = self
        locationManagerInstance.desiredAccuracy = kCLLocationAccuracyBest
        locationManagerInstance.requestAlwaysAuthorization()
        locationManagerInstance.startUpdatingLocation()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getLocation(latitude : Double , longitude : Double){
        let apiURL = "https://maps.googleapis.com/maps/api/geocode/json?latlng=\(latitude),\(longitude)&key=AIzaSyAk8iSRr_NzJ_5Cajiobss0Z0IPJ28w4XY"
        var address : String = ""
        let url = URL(string: apiURL)
        let task = URLSession.shared.dataTask(with: url!){ (data, response, error) in
            if error != nil {print(error!)}
            else {
                if let urlContent = data{
                    do{
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        DispatchQueue.main.async {
                            var streetAdd = jsonResult["results"] as? [[String: AnyObject]]
                            self.chLocation.childLocationInfo = (streetAdd![0]["formatted_address"]! as? String)!
                            //print(res)
                        }
                    } catch{
                        print("JSON processing failed")
                    }
                }
            }
        }
        task.resume()
        
    }
    
    //https://maps.googleapis.com/maps/api/geocode/json?latlng=40.714224,-73.961452&key=API_KEY
    //https://developers.google.com/maps/documentation/javascript/examples/geocoding-reverse
    //AIzaSyAk8iSRr_NzJ_5Cajiobss0Z0IPJ28w4XY

}

