//
//  Location.swift
//  Location
//
//  Created by Yash Patil on 26/06/22.
//

import Foundation
import MapKit

struct Location : Identifiable,Equatable
{
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.name == rhs.name
    }
    
    let id = UUID()
    var name : String
    var cityName : String
    let coordinates  : CLLocationCoordinate2D
    let description : String
    let imageNames: [String]
    let link : String
}
