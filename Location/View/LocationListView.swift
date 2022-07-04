//
//  LocationListView.swift
//  Location
//
//  Created by Yash Patil on 27/06/22.
//

import SwiftUI

struct LocationListView: View
{
    
    @EnvironmentObject private var vm : LocationViewModel
    
    var body: some View {
        List{
            ForEach(vm.locations)
            {
                location in
                Button
                {
                    vm.showNextLocation(location: location)
                } label:
                  {
                    listView(location: location)
                  }
                    .padding(.vertical,4)
                    .listRowBackground(Color.clear)
                        
            }
            
            }.listStyle(PlainListStyle())
            .tint(.black)
        }
        
}


struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView().environmentObject(LocationViewModel())
    }
}


extension LocationListView
{
    private func listView(location : Location) -> some View {
   HStack {
        if let imageNames = location.imageNames.first {
            Image(imageNames)
                .resizable()
                .scaledToFill()
                .frame(width:50,height:50)
                .cornerRadius(10)
            
            VStack(alignment:.leading)
            {
                Text(location.name).font(.headline)
                Text(location.cityName).font(.subheadline)
                
            }
            .frame(maxWidth:.infinity,alignment: .leading)
        }
   }
    }
}
