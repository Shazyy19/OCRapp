import SwiftUI

struct ReservesView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(1...5, id: \.self) { index in
                    NavigationLink(destination: CourseDetailView(courseIndex: index)) {
                        Text("Reserved Course \(index)")
                    }
                }
            }
            .navigationTitle("My Reserves")
        }
    }
}

struct ReservesView_Previews: PreviewProvider {
    static var previews: some View {
        ReservesView()
    }
}
