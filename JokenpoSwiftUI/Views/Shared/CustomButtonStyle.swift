//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title2)
            .padding(20)
            .foregroundColor(.black)
            .background(.secondary)
            .foregroundColor(.secondary)
            .padding(5)
            .background(.ultraThinMaterial)
    }
}
