//
//  ContentView.swift
//  RestApi
//

import SwiftUI

struct ContentView: View {
    @StateObject var productViewModel = ProductViewModel()

    var body: some View {
        NavigationSplitView {
            if productViewModel.isLoading{
                ProgressView()
                    .scaleEffect(1.5)
            }
            
            else if let errorMessage = productViewModel.errorMessage{
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.red)

                Text(errorMessage)
                    .font(.title)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Button("Retry"){
                    Task{
                        await productViewModel.fetchProducts()
                    }
                }
            }
            
            else{
                List(productViewModel.products) { product in
                    NavigationLink{
                        ProductView(product: product)
                    } label:{
                        ProductRowView(product: product)
                            .frame(height: 75)
                    }
                    .listRowBackground(Color.clear)
                }
                .navigationTitle("Products")
            }
            
        } detail: {
            Text("Select a product to view details")
                .foregroundColor(.secondary)
        }
        .task {
            await productViewModel.fetchProducts()
        }
    }
}


#Preview {
    ContentView()
}
