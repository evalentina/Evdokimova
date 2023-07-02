//
//  ReusableDishPriceAndWeight.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 02.07.2023.
//

import SwiftUI

struct ReusableDishPriceAndWeightView: View {
    var dish: Dish
    var body: some View {
        HStack(spacing: 0) {
            
            Text("\(dish.price) ₽ ")
                .textStyle(weight: .regular, size: 14)
            
            Text("· \(dish.weight)г")
                .textStyle(weight: .regular, size: 14)
                .foregroundColor(.black.opacity(0.4))
        }
    }
}


