import SwiftUI

struct Tabbar: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = .systemGray3
    }

    var body: some View {
           TabView {
               HomeView()
                   .tag(1)
                   .tabItem {
                       Image("home")
                           .renderingMode(.template)
                   }
               Text("search")
                   .tag(2)
                   .tabItem {
                       Image("discover")
                           .renderingMode(.template)
                   }
            Text("the creation of the post")
                .tag(3)
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                        .renderingMode(.template)
                }
            Text("Watch list")
                .tag(4)
                .tabItem {
                    Image("heart")
                        .renderingMode(.template)
                }
            Text("profile")
                .tag(5)
                .tabItem {
                    Image(systemName: "person.fill")
                        .renderingMode(.template)
                }
        }
        .tint(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}
