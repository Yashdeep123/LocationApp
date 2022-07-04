//
//  LocationViewModel.swift
//  Location
//
//  Created by Yash Patil on 27/06/22.
//

import SwiftUI
import Foundation
import MapKit


class LocationViewModel: ObservableObject
{
    @Published var locations : [Location]
    @Published var SheetLocation: Location? = nil
    @Published var CurrentmapLocation : Location
    {
        didSet
        {
            UpdateMapRegion(location: CurrentmapLocation)
        }
    }
    
    @Published var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
    
    @Published var showlistView : Bool = false
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init()
    {
       let locations = LocationDataService.locations
        self.locations = locations
        self.CurrentmapLocation = locations.first!
        
    }
    
    
    private func UpdateMapRegion(location: Location)
    {
        withAnimation(.easeInOut)
        {
        mapRegion = MKCoordinateRegion(
            center: location.coordinates,
            span: mapSpan)
            
        }
    }
    
    func toggleListView()
    {
        withAnimation(.easeInOut)
        {
            showlistView.toggle()
            
        }
    }
    
    func showNextLocation(location: Location)
    {
        withAnimation(.easeInOut)
        {
            CurrentmapLocation = location
            showlistView = false
        }
    }
    
    func nextButtonPressed()
    {
        guard let currentIndex = locations.firstIndex(where: {$0 == CurrentmapLocation}) else{return}
        
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
       
            guard let firstLocation = locations.first else{return}
        
        showNextLocation(location: firstLocation)
            return
        }
         let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}


