//
//  LocationPreview.swift
//  Location
//
//  Created by Yash Patil on 02/07/22.
//

import SwiftUI

struct LocationPreview: View
{
    @EnvironmentObject private var vm : LocationViewModel
    let location: Location
    
    
    var body: some View {
        HStack(alignment:.bottom,spacing: 0)
        {
            VStack(alignment:.leading,spacing:10)
        {
            imageSection
            infoSection
        }
        
            VStack
            {
                Button
                {
                    vm.SheetLocation = location
                }
            label:
                {
                    Text("Learn more").font(.headline)
                        .frame(width: 125, height: 35)
                }.buttonStyle(.borderedProminent).tint(.red)
                
                
                Button(action: vm.nextButtonPressed)
                {
                    Text("Next").font(.headline)
                        .frame(width: 125, height: 35)
                }.buttonStyle(.bordered).tint(.red)
            }
        }.padding()
            .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y:50)
            ).cornerRadius(10)
    }
}




extension LocationPreview
{
    private var imageSection : some View
    {
        ZStack
    {
        if let imageNames = location.imageNames.first
        {
            Image(imageNames).resizable()
                .scaledToFill()
                .frame(width:105,height:105)
                .cornerRadius(10)
                
        }
            
    }.padding(8)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var infoSection : some View
    {
        VStack(alignment: .leading, spacing: 4)
        {
        Text(location.name).font(.title2).fontWeight(.bold)
            Text(location.cityName).font(.subheadline)
            
            
        }.frame(maxWidth:.infinity,alignment: .leading)
            .padding(.top)
            
    }
}






struct LocationPreview_Previews: PreviewProvider {
    static var previews: some View {
        
        LocationPreview(location: LocationDataService.locations.first!)
            .environmentObject(LocationViewModel())
    }
}
