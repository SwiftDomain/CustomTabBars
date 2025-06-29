import SwiftUI

struct WineList: View {
    var body: some View {
        NavigationStack{
            VStack {
                Image(systemName: "wineglass")
                    .resizable()
                    .scaledToFit()
                    .padding(40)
                    .frame(height: 400)
                Text("Wine List")
                    .font(.largeTitle)
                    .bold()
                    .navigationTitle("Wone List")
                Spacer()
            }
        }
    }
}

#Preview {
    WineList()
}
