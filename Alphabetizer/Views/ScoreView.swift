import SwiftUI

struct ScoreView: View {
    
    // MARK: - Properties
    
    @Environment(Alphabetizer.self) private var alphabetizer
    
    // MARK: - Body
    
    var body: some View {
        Text("Score: \(alphabetizer.score)")
            .font(.largeTitle)
            .foregroundStyle(Color.purple)
            .bold()
    }
}

// MARK: - Previews

#Preview {
    ScoreView()
        .environment(Alphabetizer())
}
