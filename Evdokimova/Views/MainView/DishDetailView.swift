//
//  DishDetailview.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 30.06.2023.
//

import SwiftUI

struct DishDetailView: View {
    
    // MARK: Variables
    @ObservedObject var viewModel: DishDetailViewModel
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
        VStack {
            
            ZStack {
                AsyncImage(url: URL(string: viewModel.dish.imageURL)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .padding()
                        .overlay {
                            
                        }
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: 230, maxHeight: 230, alignment: .center)
            }
            .frame(maxWidth: .infinity, maxHeight: 230, alignment: .center)
            .background(Color.buttonColor)
            .overlay {
                HStack {
                    Spacer()
                    
                    Button {
                        viewModel.close()
                    } label: {
                        HStack {
                            Image(systemName: "heart")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.black)
                                .padding(10)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        
                    }
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Image(systemName: "heart")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.black)
                                .padding(10)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        
                    }
                    
                }
                .frame(alignment: .topTrailing)
                .foregroundColor(.black)
            }
                
                
                VStack {
                    
                    Text(viewModel.dish.name)
                    Text("\(viewModel.dish.price)")
                    Text(viewModel.dish.description)
                    
                    Button {
                        cartViewModel.addToCart(dish: viewModel.dish)
                    } label: {
                        Text("Добавить в корзину")
                            .padding()
                            .background(.black)
                            .foregroundStyle(.white)
                            .clipShape(Capsule())
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 250, alignment: .topLeading)
            
        }
        .frame(maxWidth: .infinity, maxHeight: 500)
        .cornerRadius(15)
        .background(Color.white)
        .padding(.horizontal, 16)
        
    }
}

struct DishDetailview_Previews: PreviewProvider {
    static var previews: some View {
        DishDetailView(viewModel: .init(dish: .dishMock, coordinator: .init(parentCoordinator: .init())))
            .environmentObject(CartViewModel())
    }
}

