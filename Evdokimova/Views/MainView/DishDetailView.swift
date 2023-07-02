//
//  DishDetailview.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 30.06.2023.
//

import SwiftUI

struct DishDetailView: View {
    
    // MARK: Properties
    
    @ObservedObject var viewModel: DishDetailViewModel
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
        VStack {
            
            dishImage(viewModel.dish.imageURL)
            
                .overlay (
                    buttonsOnImage
                        .padding(10), alignment: .topTrailing
                )
            
            dishDescription
            
            addToCartButton
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(Color.white.cornerRadius(15))
        .padding(16)
    }
}

extension DishDetailView {
    
    // MARK: Description of the characteristics of the dish - name, price and weight, general description
    
    var dishDescription: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text(viewModel.dish.name)
                .textStyle(weight: .medium, size: 16)
            
            ReusableDishPriceAndWeightView(dish: viewModel.dish)
            
            Text(viewModel.dish.description)
                .textStyle(weight: .regular, size: 14)
                .foregroundColor(.black.opacity(0.65))
        }
    }
    
    // MARK: The button adds the dish to the shopping cart
    
    var addToCartButton: some View {
        Button {
            cartViewModel.addToCart(dish: viewModel.dish)
        } label: {
            Text("Добавить в корзину")
                .textStyle(weight: .medium, size: 16)
                .frame(maxWidth: .infinity, maxHeight: 48)
                .background(Color.blueColor)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
    
    // MARK: Image of the dish
    
    @ViewBuilder
    func dishImage(_ imageURLString: String) -> some View {
        ZStack {
            Color.buttonColor.cornerRadius(10).frame(width: .infinity, height: 210)
            AsyncImageReusableView(imageURLString: imageURLString)
            .frame(width: 200, height: 200, alignment: .center)
        }
         
    }
    
    // MARK: Buttons on the image to add the dish to favorites and to close the full screen cover
    
    var buttonsOnImage: some View {
        HStack(spacing: 8) {
            Button {
                
            } label: {
                imageOnButton(ImageNames.heart.rawValue)
            }
            
            Button {
                viewModel.close()
            } label: {
                imageOnButton(ImageNames.cross.rawValue)
            }
        }
        .foregroundColor(.black)
    }
    
    // MARK: Reusable image on button
    
    @ViewBuilder
    func imageOnButton(_ imageName: String) -> some View {
        Image(imageName)
            .resizable()
            .frame(width: 24, height: 24)
            .foregroundColor(.black)
            .padding(10)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct DishDetailview_Previews: PreviewProvider {
    static var previews: some View {
        DishDetailView(viewModel: .init(dish: .dishMock, coordinator: .init(parentCoordinator: .init())))
            .environmentObject(CartViewModel())
    }
}

