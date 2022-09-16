//
//  ContentView.swift
//  NewsApp
//
//  Created by Alexander Shpin on 16.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.articles) { article in
                NavigationLink(destination: DetailView(url: article.url)) {
                    HStack {
                        Text(article.title)
                    }
                }
                
            }
            .navigationTitle("News")
        }
        .onAppear {
            networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
