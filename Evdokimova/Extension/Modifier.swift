//
//  Modifier.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 30.06.2023.
//

import Foundation
import SwiftUI

struct FullScreenCoverModifier<Item: Identifiable, Destination: View>: ViewModifier {

    // MARK: Stored Properties

    private let item: Binding<Item?>
    private let destination: (Item) -> Destination

    // MARK: Initialization

    init(item: Binding<Item?>,
         @ViewBuilder content: @escaping (Item) -> Destination) {

        self.item = item
        self.destination = content
    }

    // MARK: Methods

    func body(content: Content) -> some View {
        content.fullScreenCover(item: item, content: destination)
    }

}
/*
struct FullScreenCoverModifier2<Item: Identifiable, Destination: View>: ViewModifier {

    // MARK: Stored Properties

    private let item: Binding<Item?>
    private let destination: (Item) -> Destination

    // MARK: Initialization

    init(item: Binding<Item?>,
         @ViewBuilder content: @escaping (Item) -> Destination) {

        self.item = item
        self.destination = content
    }

    // MARK: Methods

    func body(content: Content) -> some View {
        content.fullScreenCover(item: <#T##Binding<Identifiable?>#>, content: <#T##(Identifiable) -> View#>
        content.fullScreenCover(item: item, content: destination)
    }

}
 */

