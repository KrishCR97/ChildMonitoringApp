//
//  ChildLocationHistoryViewController.swift
//  ChildrenMonitoringSystem
//
//  Created by Mucherla,Veera Kishon Kumar on 4/4/18.
//

import UIKit
import MapKit

class ChildLocationHistoryViewController: UIViewController,UITableViewDataSource{

    @IBOutlet weak var map: MKMapView!
    static var id : String?
    var data : [ChildLocation]?
    
    
    let queryBuilder = DataQueryBuilder()

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let whereClause = "childID = '\(ChildLocationHistoryViewController.id!)'"
        queryBuilder!.setWhereClause(whereClause)
        data = AppDelegate.DBInstance.backendless.data.of(ChildLocation.self).find(queryBuilder) as? [ChildLocation]
        print(whereClause)
        return data!.count
        //return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_loc")
       let nameLBL = cell?.viewWithTag(101) as! UILabel
        let numberLBL = cell?.viewWithTag(102) as! UILabel
        nameLBL.text = data![indexPath.row].childLocationInfo
        numberLBL.text = "Time goes here"
        return cell!
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let whereClause = "childID = '\(ChildLocationHistoryViewController.id!)'"
        queryBuilder!.setWhereClause(whereClause)
        data = AppDelegate.DBInstance.backendless.data.of(ChildLocation.self).find(queryBuilder) as? [ChildLocation]
        var locationArr : [CLLocationCoordinate2D] = []
        var regionArr : [MKCoordinateRegion] = []
        var annotationArr : [MKPointAnnotation] = []
        
        var span : MKCoordinateSpan = MKCoordinateSpanMake(0.5, 0.5)
        for child in data! {
            locationArr.append(CLLocationCoordinate2D(latitude : Double(child.latitude!)!,longitude: Double(child.longitude!)!))
           // break
        }
//        locationArr.append(CLLocationCoordinate2D(latitude : 37.760122,longitude: -122.468158))
//        locationArr.append(CLLocationCoordinate2D(latitude: 37.6879, longitude: -122.4702))
        for num in 0..<locationArr.count{
            regionArr.append(MKCoordinateRegionMake(locationArr[num], span))
            map.setRegion(regionArr[num], animated: true)
            var annotation = MKPointAnnotation()
            annotation.coordinate = locationArr[num]
            annotation.title = "Loc"
            annotation.subtitle = "What?"
            annotationArr.append(annotation)
            map.addAnnotation(annotationArr[num])
        // Do any additional setup after loading the view.
    }
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
