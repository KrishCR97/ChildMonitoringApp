//
//  MapPinViewController.swift
//  ChildrenMonitoringSystem
//
//  Created by student on 4/8/18.
//

import UIKit
import MapKit
class MapPinViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var locationArr : [CLLocationCoordinate2D] = []
        var regionArr : [MKCoordinateRegion] = []
        var annotationArr : [MKPointAnnotation] = []
        
        var span : MKCoordinateSpan = MKCoordinateSpanMake(0.5, 0.5)
        locationArr.append(CLLocationCoordinate2D(latitude : 37.760122,longitude: -122.468158))
        locationArr.append(CLLocationCoordinate2D(latitude: 37.6879, longitude: -122.4702))
        for num in 0..<locationArr.count{
            regionArr.append(MKCoordinateRegionMake(locationArr[num], span))
            map.setRegion(regionArr[num], animated: true)
            var annotation = MKPointAnnotation()
            annotation.coordinate = locationArr[num]
            annotation.title = "Loc"
            annotation.subtitle = "What?"
            annotationArr.append(annotation)
            map.addAnnotation(annotationArr[num])
        }
        
        
        
//        let span1 = MKCoordinateSpanMake(0.5, 0.5)
//        let location1 = CLLocationCoordinate2D(latitude: 37.6879, longitude: -122.4702)
//        let region1 = MKCoordinateRegionMake(location1, span1)
//        map.setRegion(region1, animated: true)
//        var annotation1 = MKPointAnnotation()
//        annotation1.coordinate = location1
//        annotation1.title = "Loc"
//        annotation1.subtitle = "What?"
//        map.addAnnotation(annotation1)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
