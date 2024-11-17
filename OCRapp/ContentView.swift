import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            OCRScannerView()
                .tabItem {
                    Image(systemName: "camera.fill")
                    Text("OCR Scanner")
                }
            
            ReservesView()
                .tabItem {
                    Image(systemName: "bookmark.fill")
                    Text("Reserves")
                }
        }
        .accentColor(AppColors.primaryRed)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
