//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Alexander Shpin on 16.09.2022.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var articles = [Article]()
    
    let apiKey = "c38012b5b66e47da8b057e24835f9d27"
    let baseURL = "https://newsapi.org/v2/top-headlines?country=us"
    
    func fetchData() {
        if let url = URL(string: "\(baseURL)&apiKey=\(apiKey)") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error)
                } else {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Articles.self, from: safeData)
                            DispatchQueue.main.async {
                                self.articles = results.articles
                                print(self.articles)
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
