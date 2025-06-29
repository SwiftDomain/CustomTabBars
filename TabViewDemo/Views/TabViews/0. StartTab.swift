import SwiftUI

struct StartTab: View {
    
    @State private var router = Router()
    @State private var isHidden = false
    
    var body: some View {
        
        TabView(selection: $router.selectedTab) {
            
            ForEach(TabViewEnum.allCases) { tab in
                
                let tabItem = tab.tabItem
                
                Tab(
                    tabItem.name,
                    systemImage: tabItem.systemImage,
                    value: tab) {
                        tab
                            .toolbarVisibility(.hidden, for: .tabBar)
                            .background {
                                if !isHidden {
                                    RemoveMoreButton {
                                        isHidden = true
                                    }
                                }
                            }
                    }
            }
        }
        .environment(router)
        .safeAreaInset(edge: .bottom) {
//            CustomTabBar(selectedTab: $router.selectedTab)
            SemiCircleTabBar(selectedTab: $router.selectedTab)
//          VerticalRevealTabBar(selectedTab: $router.selectedTab)
//                .frame(maxWidth: .infinity, alignment: .trailing)
//                .padding(.trailing)
        }
    }
}

#Preview {
    StartTab()
}

@Observable
class Router {
    var selectedTab: TabViewEnum = .home
}
