//
//  ClearBackground.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 01.07.2023.
//

import SwiftUI

struct ClearBackgroundView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        return InnerView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
    private class InnerView: UIView {
        override func didMoveToWindow() {
            super.didMoveToWindow()
            superview?.superview?.backgroundColor = .black.withAlphaComponent(0.4)
        }
        
    }
}
