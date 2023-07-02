//
//  BoxView.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 28.06.2023.
//

import SwiftUI


struct CartView: View {
    
    // MARK: Properties
    
    @EnvironmentObject var viewModel: CartViewModel
    
    // MARK: GridItem Property
    
    var gridLayout = [GridItem()]
    
    var body: some View {
        
        CustomNavigationBarContainer {
            VStack {
                ScrollView {
                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 16) {
                        ForEach(Array(viewModel.dishesInCart.keys), id: \.self) { dish in
                            
                            // MARK: If the number of dishes in the shopping cart is greater than 0, then display information about the dish
                            
                            if (viewModel.dishesInCart[dish] ?? 0) > 0 {
                                
                                dishStack(dish)
                            }
                        }
                    }
                }
                
                payButton
            }
            .onAppear {
                viewModel.countTotalPrice()
            }
            .padding(16)
        }
        
    }
}

extension CartView {
    
    // MARK: HStack for each dish in the shopping cart
    
    @ViewBuilder
    func dishStack(_ dish: Dish) -> some View {
        HStack(alignment: .center, spacing: 8) {
            
            dishInforamtion(dish)
            
            Spacer()
            
            minusAndPlusButtons(dish)
        }
    }
    
    // MARK: HStack with information about the dish: image, name, price, and weight
    
    @ViewBuilder
    func dishInforamtion(_ dish: Dish) -> some View {
        HStack {
            
            GeometryReader { geo in
                // MARK: Geometry Reader modifies alignment, therefore, an additional stack is needed
                
                VStack(spacing: 0) {
                    AsyncImageReusableView(imageURLString: dish.imageURL)
                }
                .frame(width: geo.size.width,
                       height: geo.size.height,
                       alignment: .center)
            }
            .clipped()
            .aspectRatio(1, contentMode: .fit)
            .frame(width: 62, height: 62)
            .background(Color.buttonColor.cornerRadius(10))

            dishDescriptions(dish)
             
        }
    }
    
    // MARK: VStack with information about the dish: name, price, and weight
    
    @ViewBuilder
    func dishDescriptions(_ dish: Dish) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(dish.name)
                .textStyle(weight: .regular, size: 14)
            
            ReusableDishPriceAndWeightView(dish: dish)
            
        }
    }
    
    // MARK: Pay button with the total price of all the dishes in the shopping cart
    
    var payButton: some View {
        Button {
            
        } label: {
            Text("Оплатить \(viewModel.totalPrice.formattedWithSeparator  ) ₽")
                .textStyle(weight: .medium, size: 16)
                .frame(maxWidth: .infinity, maxHeight: 48)
                .background(Color.blueColor)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
    
    // MARK: HStack with minus and plus buttons and information about the number of dishes in the shopping cart
    
    @ViewBuilder
    func minusAndPlusButtons(_ dish: Dish) -> some View {
        HStack(spacing: 10) {
            
            Button {
                viewModel.minusButton(dish: dish)
            } label: {
                reusableImage(ImageNames.minus.rawValue)
            }
            
            Text(String(viewModel.dishesInCart[dish] ?? 0))
            
            Button {
                viewModel.plusButton(dish: dish)
            } label: {
                reusableImage(ImageNames.plus.rawValue)
                
            }
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 4)
        .textStyle(weight: .medium, size: 14)
        .background(Color.cartButtonsColor.cornerRadius(10))
        .frame(width: 130, alignment: .trailing)
        
    }
    
    // MARK: Reusable image for minus and plus buttons
    
    @ViewBuilder
    func reusableImage(_ systemName: String) -> some View {
        Image(systemName: systemName)
            .foregroundColor(.black)
            .padding(10)
            .clipShape(Rectangle())
    }
    
    
}

struct BoxView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartViewModel())
    }
}
