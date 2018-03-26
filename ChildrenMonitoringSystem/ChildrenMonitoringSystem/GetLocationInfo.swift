//
//  GetLocationInfo.swift
//  ChildrenMonitoringSystem
//
//  Created by student on 3/24/18.
//

import Foundation
class GetLocationInfo{
func getLocation(latitude : String , longitude : String){
        let apiURL = "https://maps.googleapis.com/maps/api/geocode/json?latlng=40.714224,-73.961452&key=AIzaSyAk8iSRr_NzJ_5Cajiobss0Z0IPJ28w4XY"
        let url = URL(string: apiURL)
        let task = URLSession.shared.dataTask(with: url!){ (data, response, error) in
            if error != nil {print(error!)}
            else {
                if let urlContent = data{
                    do{
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        DispatchQueue.main.async {
                            print(jsonResult)
//                            self.sunsignLBL.text = "\(jsonResult["sunsign"]!!)"
//                            self.dateLBL.text = "\(jsonResult["date"]!!)"
//                            self.sunsignImage.image = zodiacImage
//                            self.horoscopeTF.text = "\(jsonResult["horoscope"]!!)"
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
