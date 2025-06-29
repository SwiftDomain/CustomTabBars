import SwiftUI

struct VerticalRevealTabBar: View {
    @Binding var selectedTab: TabViewEnum
    @State private var isExpanded = false
    var body: some View {
        ZStack {
            let allTabs = TabViewEnum.allCases
            ForEach(allTabs.indices, id: \.self) { index in
                let tabView = allTabs[index]
                let yOffset = yOffsetForButton(at: index, total: allTabs.count)
                Button {
                    withAnimation {
                        selectedTab = tabView
                        isExpanded.toggle()
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
                .offset(
                    y: isExpanded ? yOffset : 0
                )
                .animation(.spring(), value: isExpanded)
            }
            // Selected Button on top
            Button {
                withAnimation {
                    isExpanded.toggle()
                }
            } label: {
                Image(systemName: selectedTab.tabItem.systemImage)
                    .font(.system(size: 24))
                    .bold()
                    .padding()
                    .frame(width: 60)
                    .foregroundStyle(.white)
                    .background(selectedTab.tabItem.color, in: .circle)
            }
            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
            
        }
    }
    
    private func yOffsetForButton(at index: Int, total: Int) -> CGFloat {
        CGFloat(-50 * index) - 60
    }
}

#Preview {
    @Previewable @State var selectedTab = TabViewEnum.home
    VerticalRevealTabBar(selectedTab: $selectedTab)
}
