//
//  CustomNavigationBar.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 30.06.2023.
//

import SwiftUI

struct CustomNavigationBar: View {
    
    var body: some View {
        
        HStack {
            
            cityAndDate
            
            Spacer()
            
            ReusableUserImage()
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
    }
}

extension CustomNavigationBar {
    
    // MARK: City and date on the local device
    
    var cityAndDate: some View {
        HStack(alignment: .top, spacing: 4) {
            Image(ImageNames.map.rawValue)
                .frame(width: 24, height: 24)
            
            VStack(spacing: 4) {

                Text(getCity())
                    .textStyle(weight: .medium, size: 18)
                
                Text(Date.now, format: .dateTime.day().month().year())
                    .textStyle(weight: .regular, size: 14)
                    .foregroundColor(.black.opacity(0.5))
            }
        }
        
    }

    // MARK: Get a city using a time zone
    
    func getCity() -> String {
        let timeZone = String(TimeZone.current.identifier)
        let city = timeZone.split(separator: "/")
        return String(city[1])
    }
    
}

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar()
            .previewLayout(.sizeThatFits)
    }
}


