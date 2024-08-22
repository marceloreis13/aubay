//
//  APIError.swift
//  Aubay
//
//  Created by Marcelo Reis on 22/08/2024.
//
import Foundation

enum APIError: Error, LocalizedError {
    case networkError
    case decodingError
    case invalidResponse
    
    var errorDescription: String? {
        switch self {
        case .networkError:
            return "Network connection failed. Please try again."
        case .decodingError:
            return "Failed to decode the data. Please try again."
        case .invalidResponse:
            return "Invalid response from the server. Please try again."
        }
    }
}
