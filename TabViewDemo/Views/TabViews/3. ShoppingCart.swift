//
//----------------------------------------------
// Original project: TabViewDemo
// by  Stewart Lynch on 2025-01-26
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2025 CreaTECH Solutions. All rights reserved.



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
