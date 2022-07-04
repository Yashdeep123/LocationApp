//
//  MapAnnotationView.swift
//  Location
//
//  Created by Yash Patil on 03/07/22.
//

import SwiftUI

struct MapAnnotationView: View {
    var body: some View
    {
        VStack {
            Image(systemName: "mappin.circle.fill")
                .resizable().scaledToFit()
                .frame(width:30,height:30)
                .foregroundColor(.white)
                .padding(6)
                .background(Color.red)
            .clipShape(Circle())
            Image(systemName: "triangle.fill")
                .foregroundColor(.red)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -7)
                
        }.padding(.bottom,40)
        
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationView()
    }
}
