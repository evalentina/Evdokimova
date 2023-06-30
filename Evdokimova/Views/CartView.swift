//
//  BoxView.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 28.06.2023.
//

import SwiftUI

struct CartView: View {

    var gridLayout = [GridItem()]
    @EnvironmentObject var viewModel: CartViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 8) {
                ForEach(Array(viewModel.dishesInCart.keys), id: \.self) { dish in
                    if (viewModel.dishesInCart[dish] ?? 0) > 0 {
                        HStack {
                            AsyncImage(url: URL(string: dish.imageURL)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(maxWidth: 100)
                            .frame(height: 150)
                            
                            .overlay(
                                Text(dish.name)
                                    .font(.callout)
                                    .foregroundColor(.black)
                                    .padding(.top, 12)
                                    .padding(.leading, 16), alignment: .topLeading)
                            
                            Button {
                                viewModel.plusButton(dish: dish)
                            } label: {
                                Text("+")
                            }
                            Text(String(viewModel.dishesInCart[dish] ?? 0))
                            Button {
                                viewModel.minusButton(dish: dish)
                            } label: {
                                Text("-")
                            }
                        }
                    }
                }
            }
        }
    }
}

struct BoxView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartViewModel())
    }
}
