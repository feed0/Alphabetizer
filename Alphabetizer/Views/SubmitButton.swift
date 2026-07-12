import SwiftUI

struct SubmitButton: View {
    
    // MARK: - Properties
    
    @Environment(Alphabetizer.self) private var alphabetizer
    
    // MARK: - Body
    
    var body: some View {
        Button {
            alphabetizer.submit()
        } label: {
            Image(systemName: "play.circle")
                .font(.system(size: 60))
                .foregroundStyle(Color.white)
                .padding(.horizontal, 80)
                .padding(.vertical, 20)
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(Color.purple)
                )
        }
    }
}

// MARK: - Previews

#Preview {
    SubmitButton()
        .environment(Alphabetizer())
}
