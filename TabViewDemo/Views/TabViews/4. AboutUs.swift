import SwiftUI

struct AboutUs: View {
    var body: some View {
        NavigationStack{
            VStack {
                Image(systemName: "info")
                    .resizable()
                    .scaledToFit()
                    .padding(40)
                    .frame(height: 400)
                Text("About Us")
                    .font(.largeTitle)
                    .bold()
                    .navigationTitle("About us")
                Spacer()
            }
        }
    }
}

#Preview {
    AboutUs()
}
