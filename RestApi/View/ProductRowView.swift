//
//  ProductRowView.swift
//  RestApi
//

import SwiftUI

struct ProductRowView: View {
    let product: Product
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: product.image)){ phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                    Image(systemName: "questionmark")
                @unknown default:
                    Image(systemName: "camera.metering.unknown")
                }
            }
            .frame(width: 75, height: 75)
            Text("Title \(product.title)")
        }
    }
}
