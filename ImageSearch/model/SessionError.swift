//
//  SessionError.swift
//  ImageSearch
//
//  Created by Petar Perich on 07.12.2020.
//

import Foundation


enum SessionError: Error {
    
    case invalidUrl, decodingError(Error), serverError(_ statusCocde: Int), other(Error)
    
    var locolizedDescription: String {
        switch self {
        case .invalidUrl:
            return "Wrong adress"
        case .decodingError(let error):
            return error.localizedDescription
        case let .serverError(statusCode):
            return "No connection \(statusCode)"
        case let .other(error):
            return error.localizedDescription
        }
    }
}

