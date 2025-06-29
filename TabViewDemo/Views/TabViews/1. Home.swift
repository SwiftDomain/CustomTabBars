import SwiftUI

struct Home: View {
    var body: some View {
        NavigationStack{
            VStack {
                Image(systemName: "house")
                    .resizable()
                    .scaledToFit()
                    .padding(40)
                    .frame(height: 400)
                Text("Home")
                    .font(.largeTitle)
                    .bold()
                    .navigationTitle("Welcome")
                Spacer()
            }
        }
    }
}

#Preview {
    Home()
}
