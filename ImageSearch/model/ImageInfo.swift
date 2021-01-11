//
//  ImageInfo.swift
//  ImageSearch
//
//  Created by Petar Perich on 07.12.2020.
//

import Foundation


struct ImageInfo: Decodable {
    var id: Int
    var previewURL: URL?
    var webformatURL: URL?
    var likes: Int
    var views: Int
    var downloads: Int
}
