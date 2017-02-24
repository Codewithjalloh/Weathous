//
//  Location.swift
//  Weathous
//
//  Created by wealthyjalloh on 24/02/2017.
//  Copyright © 2017 CWJ. All rights reserved.
//

import Foundation
import CoreLocation


class Location {
    
    // shared instance 
    static var sharedInstance = Location()
    private init() {}
    
    
    var latitude: Double!
    var longitude: Double!
}
