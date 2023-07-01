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
            VStack {
                HStack {
                    Image("map")
                    Text(getCity())
                }
                Text(Date.now, format: .dateTime.day().month().year())
            }
            Spacer()
            Image("User")
                .resizable()
                  .frame(width: 44, height: 44)
                  .clipShape(Circle())
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
    }
}

extension CustomNavigationBar {
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

struct CustomNavigationBarContainer<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        VStack {
            CustomNavigationBar()
            content
        }
    }
}

struct CustomNavigationBarContainer_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBarContainer {
            Color.black
        }
            .previewLayout(.sizeThatFits)
    }
}
