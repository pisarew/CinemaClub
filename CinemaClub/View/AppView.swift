import SwiftUI

struct AppView: View {
    @State private var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("main")
                .tag(1)
                .tabItem {
                    Image(selectedTab == 1 ? "home filled-2" : "home filled")
                        .onTapGesture {
                            selectedTab = 1
                        }
                }
            Text("search")
                .tag(2)
                .tabItem {
                    Image(selectedTab == 2 ? "Tab2" : "discover filled")
                                            .onTapGesture {
                                                selectedTab = 2
                                            }
                }
            Text("the creation of the post")
                .tag(3)
                .tabItem {
                    Image("the creation of the post")
                }
            Text("Watch list")
                .tag(4)
                .tabItem {
                    Image(selectedTab == 4 ? "Tab4" : "Watch list")
                        .onTapGesture {
                            selectedTab = 4
                        }
                }
            Text("profile")
                .tag(5)
                .tabItem {
                    Image(selectedTab == 5 ? "profile filled" : "profile")
                        .onTapGesture {
                            selectedTab = 5
                        }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
