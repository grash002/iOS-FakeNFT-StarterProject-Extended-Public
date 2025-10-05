//
//  CollectionRequest.swift
//  iOS-FakeNFT-Extended
//
//  Created by Иван Иван on 26.09.2025.
//
import Foundation

struct CollectionRequest: NetworkRequest {


    var endpoint: URL? {
        URL(string: "\(RequestConstants.baseURL)/api/v1/collections")
    }
}
