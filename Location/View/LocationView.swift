//
//  LocationView.swift
//  Location
//
//  Created by Yash Patil on 27/06/22.
//
import SwiftUI
import MapKit




struct LocationView: View {

    @EnvironmentObject var vm : LocationViewModel
    
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $vm.mapRegion,annotationItems: vm.locations,annotationContent:
                    {
                location in
                MapAnnotation(coordinate: location.coordinates)
                {
                    MapAnnotationView().scaleEffect(vm.CurrentmapLocation == location ? 1:0.7)
                }
            })
            .shadow(radius: 10)
            .ignoresSafeArea()
            
            
            
            VStack
            {
                header
                Spacer()
                ZStack
                {
                    ForEach(vm.locations)
                    { location in
                        if vm.CurrentmapLocation == location 
                        {
                        LocationPreview(location:location)
                            .padding()
                            .shadow(color: .black.opacity(0.2), radius: 20)
                            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                            
                        }
                    }
                }
            }
        }
        .sheet(item: $vm.SheetLocation, onDismiss: nil)
        {
            sheetlocation in
            LocationDetailView(location: sheetlocation)
        }
        }
    }



extension LocationView
{
    
    private var header : some View
    {
        VStack
        {
            Button(action: vm.toggleListView)
                   {
            Text(vm.CurrentmapLocation.name + "," + vm.CurrentmapLocation.cityName)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .frame(height:55)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading)
                  {
                     Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundColor(Color.primary)
                        .padding()
                        .rotationEffect(Angle(degrees: vm.showlistView ? 0 : 180))
                  }
        }
            if vm.showlistView {
                LocationListView()}
            
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
        .padding()
        

    }
    
        }
        
    




struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationViewModel())
            .preferredColorScheme(.dark)
    }
}
