//
//  IdentifiableError.swift
//  Aubay
//
//  Created by Marcelo Reis on 22/08/2024.
//
import Foundation

struct IdentifiableError: Identifiable {
    let id = UUID()
    let message: String
}
