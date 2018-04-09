//
//  GetLocationInfo.swift
//  ChildrenMonitoringSystem
//
//  Created by student on 3/24/18.
//

import Foundation


class GetLocationInfo{
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
                            address = (streetAdd![1]["formatted_address"]! as? String)!
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
}
