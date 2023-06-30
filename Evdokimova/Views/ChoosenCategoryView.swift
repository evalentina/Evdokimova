//
//  ChoosenCategoryView.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 29.06.2023.
//

import SwiftUI

struct ChoosenCategoryView<DetailModifier: ViewModifier>: View {
    
    @ObservedObject var viewModel: ChoosenCategoryViewModel
    var gridLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var gridLayoutRows = [GridItem(.flexible())]
    let detailModifier: DetailModifier
    
    
    var body: some View {
        ScrollView {
            LazyHGrid(rows: gridLayoutRows) {
                ForEach(Teg.allCases, id: \.self) { item in
                    Button {
                        viewModel.choosenTeg = item
                        viewModel.filterData()
                    } label: {
                        Text(item.rawValue)
                            .padding()
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(Capsule())
                    }
                }
            }
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 8) {
                ForEach(viewModel.filteredDishes) { dish in
                    Button {
                        viewModel.openDishDetail(dish: dish)
                    } label : {
                        VStack {
                            AsyncImage(url: URL(string: dish.imageURL)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 150)
                            
                            Text(dish.name)
                        }
                    }
                    .modifier(detailModifier)
                }
            }
        }
        .task {
            viewModel.getDishes()
        }
    }
}

struct ChoosenCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ChoosenCategoryView(viewModel: ChoosenCategoryViewModel(category: .init(id: 0, name: "Category", imageURL: ""), coordinator: .init(parentCoordinator: .init())), detailModifier: EmptyModifier())
    }
}



