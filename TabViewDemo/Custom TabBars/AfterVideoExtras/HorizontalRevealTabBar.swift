import SwiftUI

struct HorizontalRevealTabBar: View {
    @Binding var selectedTab: TabViewEnum
    @State private var isExpanded = false
    var body: some View {
        ZStack {
            let allTabs = TabViewEnum.allCases.filter {$0 != selectedTab}
            ForEach(allTabs.indices, id: \.self) { index in
                let tabView = allTabs[index]
                let xOffset = xOffsetForButton(at: index, total: allTabs.count)
                Button {
                    withAnimation {
                        selectedTab = tabView
                        isExpanded.toggle()
                    }
                } label: {
                    VStack() {
                        Image(systemName: tabView.tabItem.systemImage)
                            .font(.system(size: 18))
                            .bold()
                            .padding()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.white)
                            .background(tabView == selectedTab ? .gray : tabView.tabItem.color, in: .circle)
                        Text(tabView.tabItem.name)
                            .font(.system(size: 10))
                            .foregroundStyle(tabView.tabItem.color)
                    }
                    .opacity(isExpanded ? 1 : 0)
                }
                .disabled(tabView == selectedTab)
                .offset(
                    x: isExpanded ? xOffset : 0,
                    y: isExpanded ? 5 : 0
                )
                .animation(.spring(bounce: 0.5), value: isExpanded)
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
    
    private func xOffsetForButton(at index: Int, total: Int) -> CGFloat {
        CGFloat(-60 * index) - 60
    }
}

#Preview {
    @Previewable @State var selectedTab = TabViewEnum.home
    HorizontalRevealTabBar(selectedTab: $selectedTab)
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.trailing)
}
