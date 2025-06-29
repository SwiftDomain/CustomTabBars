import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: TabViewEnum
    var body: some View { 
        HStack {
            ForEach(TabViewEnum.allCases) { tabView in
                Button {
                    withAnimation {
                        selectedTab = tabView
                    }
                } label: {
                    Image(systemName: tabView.tabItem.systemImage)
                        .font(.system(size: 18))
                        .bold()
                        .padding()
                        .frame(width: 40)
                        .foregroundStyle(.white)
                        .background(tabView == selectedTab ? .gray : tabView.tabItem.color, in: .circle)
                }
                .disabled(tabView == selectedTab)
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedTab = TabViewEnum.home
    CustomTabBar(selectedTab: $selectedTab)
}
