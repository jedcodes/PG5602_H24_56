import SwiftUI
import SwiftData

struct ArticleScreenView: View {
    @Query private var categories: [Category] // Fetch categories from SwiftData
    @State private var selectedCategory: Category? // Currently selected category
    @State private var showAllArticles: Bool = true // Toggle for showing all articles
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            VStack {
                if categories.isEmpty {
                    // Show an empty view if there are no categories
                    EmptyListView(
                        title: "You currently have no saved articles.",
                        subtitle: "Go to search screen to view and save articles.",
                        imageName: "bookmark.slash.fill"
                    )
                } else {
                    // Display articles based on the selected category or show all articles
                    List {
                        if showAllArticles {
                            // Show all articles across categories
                            ForEach(categories.flatMap { $0.categoryArticles }) { article in
                                NavigationLink(destination: ArticleDetailView(article: article)) {
                                    ArticleItemView(article: article)
                                }
                            }
                        } else if let selectedCategory = selectedCategory {
                            // Show articles for the selected category
                            Section(header: Text(selectedCategory.categoryTitle).font(.headline)) {
                                ForEach(selectedCategory.categoryArticles) { article in
                                    NavigationLink(destination: ArticleDetailView(article: article)) {
                                        ArticleItemView(article: article)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Menu {
                        // Add "All Articles" option
                        Button("All Articles") {
                            showAllArticles = true
                            selectedCategory = nil
                        }
                        
                        // List all categories as options
                        ForEach(categories, id: \.categoryTitle) { category in
                            Button(category.categoryTitle) {
                                showAllArticles = false
                                selectedCategory = category
                            }
                        }
                    } label: {
                        Label("Categories", systemImage: "line.horizontal.3.decrease.circle")
                    }
                }
            }
        }
        .onAppear {
           print("Countries ...")
        }
    }
}


#Preview {
    ArticleScreenView()
}
