//
//  NetworkError.swift
//  RestApi
//
import Foundation

enum NetworkError: LocalizedError{
    case invalidURL
    case invalidResponse
    case decodingError
    case serverError(Int)
    case noData
    
    var errorDescription: String?{
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid Response"
        case .decodingError:
            return "Data Not Read"
        case .serverError(let code):
            return "Server Error \(code)"
        case .noData:
            return "No Data Found"
        }
    }
}
