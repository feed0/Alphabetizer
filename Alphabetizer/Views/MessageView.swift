import SwiftUI

struct MessageView: View {
    
    // MARK: - Properties
    
    @Environment(Alphabetizer.self) private var alphabetizer
    
    // MARK: - Body
    
    var body: some View {
        Text(alphabetizer.message.rawValue)
            .font(.largeTitle)
    }
}

// MARK: - Previews

#Preview {
    MessageView()
        .environment(Alphabetizer())
}

#Preview("You Win") {
    let alphabetizer = Alphabetizer()
    alphabetizer.message = .youWin
    
    return MessageView()
        .environment(alphabetizer)
}
