import SwiftUI

struct ArticleItemView: View {
    var article: Article
    var body: some View {
        HStack(alignment: .center,spacing: 5) {
            Image("news")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 100)
                .cornerRadius(10)
           
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(Font.custom("Poppins-Bold", size: 18))
                    .foregroundStyle(Theme.TextColor)
                
                Text(article.source)
                    .font(Font.custom("Poppins-Regular", size: 15))
                    .foregroundStyle(Theme.TextColor)
            }
        
        }
    }
}

#Preview {
    ArticleItemView(article: SampleData.MockData)
}
