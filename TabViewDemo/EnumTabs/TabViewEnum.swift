import SwiftUI

enum TabViewEnum: Identifiable, CaseIterable, View {
    
    case home, wineList, shoppingCart, info, directions, faq
    
    var id: Self { self }
    
    var tabItem: TabItem {
       
        switch self {
            case .home:
                    .init(name: "Welcome", systemImage: "house", color: .blue)
            case .wineList:
                    .init(name: "Wine List", systemImage: "wineglass", color: .purple)
            case .shoppingCart:
                    .init(name: "Cart", systemImage: "cart", color: .red)
            case .info:
                    .init(name: "About Us", systemImage: "info", color: .green)
            case .directions:
                    .init(name: "Directions", systemImage: "map", color: .orange)
            case .faq:
                    .init(name: "FAQ", systemImage: "questionmark", color: .teal)
        }
        
    }
    
    var body: some View {
        
        switch self {
            case .home:
                Home()
            case .wineList:
                WineList()
            case .shoppingCart:
                ShoppingCart()
            case .info:
                AboutUs()
            case .directions:
                Directions()
            case .faq:
                FAQ()
        }
        
    }
}
