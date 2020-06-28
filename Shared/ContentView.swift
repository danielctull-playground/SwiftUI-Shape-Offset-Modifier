
import SwiftUI

struct ContentView: View {

    var body: some View {

        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
            .adjustFrame {
                CGRect(x: $0.origin.x,
                       y: $0.origin.y,
                       width: $0.size.width + 100,
                       height: $0.size.height)
            }
            .fill(Color.red)
            .overlay(
                RoundedRectangle(cornerRadius: 25.0)
                    .adjustFrame {
                        CGRect(x: $0.origin.x,
                               y: $0.origin.y,
                               width: $0.size.width + 100,
                               height: $0.size.height)
                    }
                    .fill(Color.blue)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 20)
                    .clipped()
            )
            .padding(.top, 20)
            .padding(.leading, 20)
            .padding(.bottom, 20)
            .clipped()
    }
}

extension Shape {

    func adjustFrame(_ adjustment: @escaping (CGRect) -> CGRect) -> some Shape {
        FrameAdjustedShape(original: self, adjustment: adjustment)
    }
}

struct FrameAdjustedShape<Original: Shape>: Shape {

    let original: Original
    let adjustment: (CGRect) -> CGRect
    func path(in rect: CGRect) -> Path {
        original.path(in: adjustment(rect))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 400.0, height: 150))
    }
}
