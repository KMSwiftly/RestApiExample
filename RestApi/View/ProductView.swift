//
//  ProductView.swift
//  RestApi
//

import SwiftUI

struct ProductView: View{
    let product: Product
    
    var body: some View{
        VStack{
            AsyncImage(url: URL(string: product.image)){ image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(15)
                
            } placeholder:{
                ProgressView()
            }
            Text(product.title)
                .multilineTextAlignment(.center)
                .font(.title)
            Text("Category: " + product.category)
            Text("Price: " + product.price.moneyStyle() + "$")
            Text(product.description)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}
