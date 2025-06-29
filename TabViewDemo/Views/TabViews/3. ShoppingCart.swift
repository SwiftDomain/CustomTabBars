import SwiftUI

struct ShoppingCart: View {
    @State private var makePurchase = false
    @State private var total = 0
    var body: some View {
        NavigationStack{
            VStack{
                Image(systemName: "cart")
                    .resizable()
                    .scaledToFit()
                    .padding(40)
                    .frame(height: 400)
                Text("Shopping Card")
                    .bold()
                Text("Purchase total: \(total)")
                Spacer()
            }.font(.largeTitle)
                .navigationTitle("Shopping Cart")
                .sheet(isPresented: $makePurchase) {
                    PurchaseView(total: $total)
                }
                .toolbar {
                    Button {
                        makePurchase.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
        }
    }
}

#Preview {
    ShoppingCart()
}
