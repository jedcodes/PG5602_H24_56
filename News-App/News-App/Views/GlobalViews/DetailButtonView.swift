import SwiftUI

struct DetailButtonView: View {
    var action: () -> Void
    var buttonTitle: String
    var body: some View {
        Button(action: action) {
            Text(buttonTitle)
                .font(Font.custom("Poppins-Medium", size: 18))
                .frame(maxWidth: .infinity)
                .padding()
                .background(Theme.ButtonColor)
                .foregroundColor(Theme.ButtonTextColor)
                .cornerRadius(8)
        }
    }
}

#Preview {
    DetailButtonView(action: {print("Test")}, buttonTitle: "View more")
}
