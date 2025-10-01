//
//  ProductProtocol.swift
//  RestApi
//

protocol ProductProtocol{
    func fetchProducts(url: String) async
    var isLoading: Bool { get }
    var errorMessage: String? { get }
}
