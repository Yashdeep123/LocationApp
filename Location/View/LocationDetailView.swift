//
//  LocationDetailView.swift
//  Location
//
//  Created by Yash Patil on 04/07/22.
//

import SwiftUI

struct LocationDetailView: View

{
    @EnvironmentObject private var vm : LocationViewModel
    
    let location : Location
    var body: some View
    {
        ScrollView
        {
            VStack(alignment: .leading)
            {
                imageSection
                    .shadow(color: Color.black.opacity(0.5), radius: 20, x: 0, y: 0)
                TitleSection.padding()
                Divider()
                DescriptionLinkSection
        
                    
            }
        }
        .ignoresSafeArea()
        .overlay(alignment: .topLeading)
        {
           ButtonStyle
                
        }
        
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationDataService.locations.first!)
            .environmentObject(LocationViewModel())
            
    }
}


extension LocationDetailView
{
    
    private var imageSection : some View
    {
        TabView
        {
            ForEach(location.imageNames, id: \.self)
            {
                locationImage in
                Image(locationImage)
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
                    
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
        
        
    }
    private var TitleSection : some View
    {
        VStack(alignment: .leading,spacing:5)
        {
            Text(location.name)
                .fontWeight(.bold)
                .font(.largeTitle)
            
            Text(location.cityName)
                .fontWeight(.semibold)
                .font(.title2)
                .foregroundColor(.secondary)
            
        }
    }
    private var DescriptionLinkSection : some View
    {
        VStack
        {
            Text(location.description).padding()
            if let url = URL(string: location.link) {
            Link(destination: url)
            {
                Text("Read more on Wikipedia")
            }.padding()
            }
        }
        
    }
    private var ButtonStyle : some View
    {
        
        Button {
            vm.SheetLocation = nil
        } label: {
            Image(systemName: "multiply")
                .font(.headline)
                .padding()
                .background()
                .cornerRadius(30)
                .padding()
        }

    }
    
}
