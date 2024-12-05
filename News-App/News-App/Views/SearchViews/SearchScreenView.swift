import SwiftUI

struct SearchScreenView: View {
    @State private var isShowingSheet: Bool = false
    private let model = SearchAPI()
    @State private var searchTerm: String = ""
    var body: some View {
        NavigationStack {
            ZStack {
                Color(Theme.PrimaryBG)
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    TextField("Search...", text: $searchTerm)
                        .padding()
                        .background(Theme.SecondaryBG)
                        .cornerRadius(10)
                        .onSubmit {
                            Task {
                                await model.getArticles(query: searchTerm)
                            }
                        }
                    
                   
                    
                    if model.articles.isEmpty {
                        EmptyListView(title: "Enter search term", subtitle: "Or tap on filter more to customize your search", imageName: "plus")
                    } else {
                      List {
                          ForEach(model.articles, id: \.publishedAt) { article in
                              NavigationLink(destination: SearchDetailView(article: article)) {
                                  SearchResultView(article: article)
                              }
                          }
                        }
                      .listStyle(.plain)
                      .listRowSeparator(.hidden)
                    }
                    Spacer()
                    
                }
                .padding(.horizontal, 20)
            }
            .navigationTitle("Search")
        }
    }
}

#Preview {
    SearchScreenView()
}
