//
//  Constants.swift
//  Weathous
//
//  Created by wealthyjalloh on 24/02/2017.
//  Copyright © 2017 CWJ. All rights reserved.
//

import Foundation


let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="

// my own api key from openweathermap.org
let API_KEY = "32a4171176f68f5d5c27383d8fc7c01d"

// typealias 
typealias DownloadComplete = () -> ()

// current weather url from openweathermap.org
let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=32a4171176f68f5d5c27383d8fc7c01d"

// forecast url for the following 10 days
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&mode=json&appid=32a4171176f68f5d5c27383d8fc7c01d"



