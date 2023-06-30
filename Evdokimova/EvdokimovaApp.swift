//
//  EvdokimovaApp.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 28.06.2023.
//

import SwiftUI

@main
struct EvdokimovaApp: App {
    
    @StateObject var coordinator = TabCoordinatorObject()
    
    var body: some Scene {
        WindowGroup {
            TabCoordinatorView(coordinator: coordinator)
        }
    }
}
