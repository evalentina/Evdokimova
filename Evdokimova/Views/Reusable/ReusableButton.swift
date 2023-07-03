//
//  ReusableButton.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 03.07.2023.
//

import SwiftUI

struct ReusableButton: View {
    
    var textOnTheButton: String
    
    var body: some View {
        
        Text(textOnTheButton)
            .textStyle(weight: .medium, size: 16)
            .frame(maxWidth: .infinity, maxHeight: 48)
            .background(Color.blueColor)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}


