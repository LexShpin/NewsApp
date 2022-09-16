//
//  ArticleData.swift
//  NewsApp
//
//  Created by Alexander Shpin on 16.09.2022.
//

import Foundation

struct Articles: Decodable {
    let articles: [Article]
}

struct Article: Decodable, Identifiable {
    var id: UUID {
        return UUID()
    }
    let title: String
    let urlToImage: String?
    let url: String
}
