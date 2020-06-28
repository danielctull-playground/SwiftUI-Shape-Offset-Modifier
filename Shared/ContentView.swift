
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
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 10)
            )
            .padding(.top, 10)
            .padding(.leading, 10)
            .padding(.bottom, 10)
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
            .frame(width: 300, height: 100, alignment: .center)
    }
}
