//
//  RestApiViewModel.swift
//  RestApi
//

import Foundation

@MainActor
class ProductViewModel: @preconcurrency ProductProtocol, ObservableObject{
    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let networkManager = NetworkManager.shared
    
    func fetchProducts(url: String = "https://fakestoreapi.com/products") async{
        isLoading = true
        errorMessage = nil
        
        do{
            products = try await networkManager.fetchData(url: url)
        } catch{
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
