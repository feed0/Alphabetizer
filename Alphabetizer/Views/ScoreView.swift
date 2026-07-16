import SwiftUI

struct ScoreView: View {
    
    // MARK: - Properties
    
    @Environment(Alphabetizer.self) private var alphabetizer
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 8) {
            scoreText
            if alphabetizer.totalAttempts > 0 {
                winRateText
            }
        }
    }
    
    // MARK: - Subviews
    
    private var scoreText: some View {
        Text("Score: \(alphabetizer.score)")
            .font(.largeTitle)
            .foregroundStyle(Color.purple)
            .bold()
    }
    
    private var winRateText: some View {
        Text("Win Rate: \(Int(alphabetizer.winPercentage))%")
            .font(.title2)
            .foregroundStyle(Color.purple.opacity(0.7))
    }
}

// MARK: - Previews

#Preview {
    ScoreView()
        .environment(Alphabetizer())
}

#Preview("Win rate") {
    let alphabetizer = Alphabetizer()
    alphabetizer.totalAttempts = 10
    alphabetizer.wins = 4
    
    return ScoreView()
        .environment(alphabetizer)
}
