//

import SwiftUI

struct CustomTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .font(.title2)
            .padding()
            .background(.secondary)
            .padding(5)
            .background(.ultraThinMaterial)
    }
}
