//
//  Forecast.swift
//  Weathous
//
//  Created by wealthyjalloh on 24/02/2017.
//  Copyright © 2017 CWJ. All rights reserved.
//

import Foundation
import Alamofire


class Forecast {
    
    // properties
    var _date: String!
    var _weatherType: String!
    var _hightTemp: String!
    var _lowTemp: String!
    
    
    // set the dates
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    // set weather type
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    // set the highTemp
    var hightTemp: String {
        if _hightTemp == nil {
            _hightTemp = ""
        }
        return _hightTemp
    }
    
    // set the lowTemp
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    // initialize the weather dictionary
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            
            if let min = temp["min"] as? Double {
                
                
                // convert Fahrenheit for min temp
                let kelvinToFarehPreDiv = (min * (9/5) - 459.67)
                let kelvinToFarenh = Double(round(10 * kelvinToFarehPreDiv / 10))
                
                self._lowTemp = "\(kelvinToFarenh)"
                
            }
            // convert Fahrenheit  for max temp
            if let max = temp["max"] as? Double {
                
                let kelvinToFarehPreDiv = (max * (9/5) - 459.67)
                let kelvinToFarenh = Double(round(10 * kelvinToFarehPreDiv / 10))
                
                self._hightTemp = "\(kelvinToFarenh)"
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
            
            
        }
    }

}

// extension for the Date
extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
