//
//  Untitled.swift
//  RestApi
//

import SwiftUI

struct Product: Codable, Identifiable{
    let id: Int
    let title: String
    let price: Float
    let description: String
    let category: String
    let image: String
}
