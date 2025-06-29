import SwiftUI

struct FAQ: View {
    var body: some View {
        NavigationStack{
            VStack{
                Image(systemName: "questionmark")
                    .resizable()
                    .scaledToFit()
                    .padding(40)
                    .frame(height: 400)
                Text("FAQ")
                    .font(.largeTitle)
                    .bold()
                    .navigationTitle("FAQ")
                Spacer()
            }
        }
    }
}

#Preview {
    FAQ()
}
