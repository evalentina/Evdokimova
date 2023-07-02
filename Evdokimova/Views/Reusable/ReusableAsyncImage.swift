//
//  ReusableAsyncImage.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 02.07.2023.
//

import SwiftUI

struct AsyncImageReusableView: View {
    
    var imageURLString: String
    var body: some View {
        AsyncImage(url: URL(string: imageURLString)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
}
