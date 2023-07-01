//
//  ChoosenCategoryView.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 29.06.2023.
//

import SwiftUI

struct ChoosenCategoryView<DetailModifier: ViewModifier>: View {
    
    // MARK: Variables
    @ObservedObject var viewModel: ChoosenCategoryViewModel
    let detailModifier: DetailModifier
    
    // MARK: GridItem Variable
    var gridLayoutColumns = [GridItem(), GridItem(), GridItem()]
    var gridLayoutRows = [GridItem()]
    
    var body: some View {
        
        ScrollView {
            
            tagsOfDishes
            
            dishes
            
        }
        .task {
            // MARK: Get dishes using network manager
            viewModel.getDishes()
        }
    }
}

extension ChoosenCategoryView {
    
    // MARK: Tags of dishes. When you click on the tag, the list of dishes is filtered
    var tagsOfDishes: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayoutRows, spacing: 10) {
                ForEach(Teg.allCases, id: \.self) { item in
                    Button {
                        viewModel.choosenTeg = item
                        viewModel.filterData()
                    } label: {
                        Text(item.rawValue)
                            .textStyle(weight: .regular, size: 14)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .foregroundColor(viewModel.choosenTeg == item ? .white : .black)
                            .background(viewModel.choosenTeg == item ? Color.blueColor : Color.buttonColor)
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal, 16)
        }
    }
    
    var dishes: some View {
        LazyVGrid(columns: gridLayoutColumns, alignment: .center, spacing: 8) {
            ForEach(viewModel.filteredDishes) { dish in
                Button {
                    viewModel.openDishDetail(dish: dish)
                } label : {
                    VStack {
                        Color.buttonColor
                            .aspectRatio(1, contentMode: .fill)
                            .overlay(
                                AsyncImage(url: URL(string: dish.imageURL)) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                                
                            ).clipped()
                        
                        
                        Text(dish.name)
                            .textStyle(weight: .regular, size: 14)
                            .foregroundColor(.black)
                    }
                }
                .modifier(detailModifier)
            }
        }
        .padding(.horizontal ,16)
        
    }
}

struct ChoosenCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ChoosenCategoryView(viewModel: ChoosenCategoryViewModel(category: .categoryhMock, coordinator: .init(parentCoordinator: .init())), detailModifier: EmptyModifier())
    }
}



