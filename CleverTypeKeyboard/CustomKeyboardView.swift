import SwiftUI

struct CustomKeyboardView: View {
    weak var delegate: KeyboardActionDelegate?
    var body: some View {
           Spacer()
            
            Text("Open Host App")
                .bold()
                .multilineTextAlignment(.center)
                .font(.system(size: 18))
                .padding(.top, 12)
            
            Button(action: {
                
                
            }) {
                Text("Open App")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.vertical, 14)
                    .background(.blue)
                    .padding(.horizontal, 32)
                    .cornerRadius(10)
            }.padding()
            
            Spacer()
        }
}
