//
//  LocationApp.swift
//  Location
//
//  Created by Yash Patil on 26/06/22.
//

import SwiftUI

@main
struct LocationApp: App
{
    
    @StateObject private var  vm = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(vm)
        }
    }
}
