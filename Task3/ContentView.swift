import SwiftUI

struct ContentView: View {
    @State private var arrowOpacity = 0.0
    @State private var secondArrowOffset = -20.0
    
    var body: some View {
        Button(action: {
            arrowOpacity = 0.0
            secondArrowOffset = -20.0
            withAnimation(.interpolatingSpring(stiffness: 150, damping: 15)) {
                arrowOpacity = 1.0
                secondArrowOffset = 20
            }
        }) {
            ZStack {
                HStack(spacing: 0) {
                    Image(systemName: "arrowtriangle.forward.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .opacity(arrowOpacity)
                        .scaleEffect(arrowOpacity, anchor: .leading)
                    Image(systemName: "arrowtriangle.forward.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .opacity(1 - arrowOpacity)
                        .scaleEffect(1 - arrowOpacity, anchor: .trailing)
                }
                Image(systemName: "arrowtriangle.forward.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .offset(x: secondArrowOffset)
            }
        }
    }
}

#Preview {
    ContentView()
}
