//
//  DishDetailview.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 30.06.2023.
//

import SwiftUI

struct DishDetailView: View {
    
    @ObservedObject var viewModel: DishDetailViewModel
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
        VStack {
            
            HStack {
                Button {
                    viewModel.close()
                } label: {
                    Text("Close")
                }
            }
            .foregroundColor(.black)
            .frame(height: 100)
            
            VStack {
                if let dish = viewModel.dish {
                    AsyncImage(url: URL(string: dish.imageURL)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 250)
                            .background(Color.red)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .padding(16)
                    VStack {
                        
                        Text(dish.name)
                        Text("\(dish.price)")
                        Text(dish.description)
                        
                        Button {                            
                            cartViewModel.addToCart(dish: dish)
                        } label: {
                            Text("Добавить в корзину")
                                .padding()
                                .background(.black)
                                .foregroundStyle(.white)
                                .clipShape(Capsule())
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 250)
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: 500)
        }
        //.frame(width: .infinity, height: 500)
        .cornerRadius(15)
        .background(Color.blue)
        .padding(.horizontal, 16)
    
    }
}

struct DishDetailview_Previews: PreviewProvider {
    static var previews: some View {
        DishDetailView(viewModel: .init(dish: .dishMock, coordinator: .init(parentCoordinator: .init())))
            .environmentObject(CartViewModel())
    }
}

struct ClearBackgroundView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return InnerView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
    private class InnerView: UIView {
        override func didMoveToWindow() {
            super.didMoveToWindow()
            // ?
            superview?.superview?.superview?.superview?.superview?.superview?.superview?.backgroundColor = .clear
        }
        
    }
}

