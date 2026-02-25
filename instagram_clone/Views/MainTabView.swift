import SwiftUI
struct MainTabView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
            NavigationStack {
                InboxView()
            }
            .tabItem {
                Image(systemName: "paperplane")
            }
            
            UploadPostView()
                .tabItem {
                    Image(systemName: "plus.square")
                }
            
            ProfileView(user: User.MOCK_USERS[0])
                .tabItem {
                    Image(systemName: "person.circle")
                }
        }
        .accentColor(.primary)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
