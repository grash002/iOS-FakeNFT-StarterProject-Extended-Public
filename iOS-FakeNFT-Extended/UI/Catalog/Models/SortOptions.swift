//
//  SortOptions.swift
//  iOS-FakeNFT-Extended
//
//  Created by Иван Иван on 26.08.2025.
//

import Foundation
import SwiftUICore

enum SortOptions: String, CaseIterable {
    case byCountNft
    case byName
    
    var title: String {
        switch self {
        case .byCountNft:
            return NSLocalizedString("Sort.ByCountNft", comment: "")
        case .byName:
            return NSLocalizedString("Sort.ByName", comment: "")
        }
    }
}
