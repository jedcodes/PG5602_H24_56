import SwiftUI

struct ContentView: View {
    @State private var showSplash: Bool = true
    var body: some View {
        ZStack {
            if showSplash {
                SplashScreenView()
                    
            } else {
                TabbarView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.showSplash = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
