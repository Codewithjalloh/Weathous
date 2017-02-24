//
//  CurrentWeather.swift
//  Weathous
//
//  Created by wealthyjalloh on 24/02/2017.
//  Copyright © 2017 CWJ. All rights reserved.
//

import UIKit
import Alamofire


class CurrentWeather {
    
    
    // weather properties
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    
    // set the city name
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    // set the date
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        // format the date 
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        // set the current date
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    // set the weather type
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    
    // function that download the weather deatils 
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        
        // download using alamofire get request 
        request(CURRENT_WEATHER_URL).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemperature = main["temp"] as? Double {
                        
                        let kelvinToFarehPreDiv = (currentTemperature * (9/5) - 459.67)
                        let kelvinToFarenh = Double(round(10 * kelvinToFarehPreDiv / 10))
                        
                        self._currentTemp = kelvinToFarenh
                        print(self._currentTemp)
                        
                    }
                }
                
                
            }
            completed()
         
            
        }
        
        
    }
    
    
    
    
}
