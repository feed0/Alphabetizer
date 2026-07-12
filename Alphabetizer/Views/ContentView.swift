import SwiftUI

struct ContentView: View {
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 20) {
            ScoreView()
            MessageView()
            Spacer()
            WordCanvas()
            Spacer()
            SubmitButton()
        }
        .padding(.top, 50)
    }
}

// MARK: - Previews

#Preview {
    ContentView()
        .environment(Alphabetizer())
}
