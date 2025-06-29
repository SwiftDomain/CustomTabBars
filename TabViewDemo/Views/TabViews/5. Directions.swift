import SwiftUI

struct Directions: View {
    var body: some View {
        NavigationStack{
            VStack{
                Image(systemName: "map")
                    .resizable()
                    .scaledToFit()
                    .padding(40)
                    .frame(height: 400)
                Text("Directions")
                    .font(.largeTitle)
                    .bold()
                    .navigationTitle("Directions")
                Spacer()
            }
        }
    }
}

#Preview {
    Directions()
}
