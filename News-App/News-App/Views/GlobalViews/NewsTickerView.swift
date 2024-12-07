import SwiftUI

struct NewsTickerView: View {
    let newsItems: [String] // Array of news headlines
    @State private var offset: CGFloat = UIScreen.main.bounds.width // Start off-screen
    @State private var isAnimating = false // Animation control
    
    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width

            ZStack {
                HStack{ // Spacing between headlines
                    ForEach(newsItems, id: \.self) { news in
                        Text(news)
                            .font(Font.custom("Poppins-SemiBold", size: 16))
                            .foregroundColor(Theme.TextColor)
                            .lineLimit(1)
                    }
                }
                .offset(x: offset) // Move horizontally
                .onAppear {
                    startTickerAnimation(screenWidth: screenWidth)
                }
            }
        }// Ensure content stays within bounds
    }
    
    private func startTickerAnimation(screenWidth: CGFloat) {
        let totalWidth = screenWidth + (CGFloat(newsItems.count) * 200) // Estimate total width of content
        offset = screenWidth // Start from the right edge
        withAnimation(.linear(duration: Double(totalWidth) / 50).repeatForever(autoreverses: false)) {
            offset = -totalWidth // Animate to the left edge
        }
    }
}

#Preview {
    NewsTickerView(newsItems: [ "Breaking News: Market hits record high!",])
}
