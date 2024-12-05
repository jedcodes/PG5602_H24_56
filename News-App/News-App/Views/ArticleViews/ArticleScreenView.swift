//
//  ArticleScreenView.swift
//  News-App
//
//  Created by Jack Delamou on 05/12/2024.
//

import SwiftUI
struct ArticleScreenView: View {
    @State private var articles: [Article] = []
    var body: some View {
       
        NavigationStack {
            NewsTickerView(newsItems: [
                "Breaking News: Market hits record high!"
            ])
                  VStack {
                      if articles.isEmpty {
                          EmptyListView(title: "You currently have no saved articles.", subtitle: "Go to search screen to view and save articles.", imageName:"bookmark.slash.fill")
                      } else {
                          List {
                              ForEach(articles, id: \.author) { article in
                                  NavigationLink(destination: ArticleDetailView(article: article)) {
                                      ArticleItemView(article: article)
                                  }
                              }
                          }
                      }
                      
                  }
                  .toolbar {
                      Button {
                         print("add")
                      } label: {
                          Image(systemName: "ellipsis.circle.fill")
                              .renderingMode(.original)
                      }
                  }
              }
        .onAppear() {
            
        }
          }
    }



#Preview {
    ArticleScreenView()
}
