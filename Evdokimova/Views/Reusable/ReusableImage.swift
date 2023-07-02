//
//  ReusableImage.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 02.07.2023.
//

import SwiftUI

struct ReusableUserImage: View {
    
    var body: some View {
        Image(ImageNames.user.rawValue)
            .resizable()
            .frame(width: 44, height: 44)
            .clipShape(Circle())
    }
}

