import SwiftUI

struct SemiCircleTabBarPlus: View {
    @Binding var selectedTab: TabViewEnum
    @State private var isExpanded = false
    var body: some View {
        ZStack {
            let allTabs = TabViewEnum.allCases
            ForEach(allTabs.indices, id: \.self) { index in
                let tabView = allTabs[index]
                let angle = angleForTabButton(at: index, total: allTabs.count)
                let radius: CGFloat = 100
                Button {
                    withAnimation {
                        selectedTab = tabView
                        isExpanded.toggle()
                    }
                } label: {
                    VStack(spacing: -5) {
                        Image(systemName: tabView.tabItem.systemImage)
                            .font(.system(size: 18))
                            .bold()
                            .padding()
                            .frame(width: 40)
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
                    x: isExpanded ? radius * cos(angle.radians) : 0,
                    y: isExpanded ? radius * sin(angle.radians) : 0
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
    
    private func angleForTabButton(at index: Int, total: Int) -> Angle {
        guard total > 1 else {
            return .degrees(-90)
        }
        let totalArc: Double = 180
        let degreesPerItem = totalArc / Double(total - 1)
        let startAngle: Double = -180
        
        let degrees = startAngle + (Double(index) * degreesPerItem)
        return .degrees(degrees)
    }
}

#Preview {
    @Previewable @State var selectedTab = TabViewEnum.home
    SemiCircleTabBarPlus(selectedTab: $selectedTab)
}
