//
//----------------------------------------------
// Original project: TabViewDemo
// by  Stewart Lynch on 2025-01-29
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
