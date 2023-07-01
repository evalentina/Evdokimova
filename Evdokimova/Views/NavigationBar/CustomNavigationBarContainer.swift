//
//  CustomNavigationBarContainer.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 01.07.2023.
//

import SwiftUI

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

