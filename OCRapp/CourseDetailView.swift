import SwiftUI

struct CourseDetailView: View {
    var courseIndex: Int

    var body: some View {
        VStack {
            Text("Course \(courseIndex) Details")
                .font(.largeTitle)
                .padding()

            // Add more details as needed

            Spacer()
        }
        .navigationTitle("Course Details")
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(courseIndex: 1)
    }
}
