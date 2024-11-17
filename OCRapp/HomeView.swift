import SwiftUI

struct HomeView: View {
    @State private var showOCRScanner = false
    @State private var searchText: String = "" // State for the search text
    @State private var showAnnouncements = false // State for showing announcements
    @State private var announcementMessage: String = "Welcome to the Course App!" // Example announcement message

    var body: some View {
        VStack(spacing: 20) {
            // Include the search bar
            SearchBar(searchText: $searchText)
                .padding()

            // Display announcements as a pop-up message
            if showAnnouncements {
                AnnouncementView(message: announcementMessage) {
                    withAnimation {
                        showAnnouncements.toggle() // Dismiss the announcement
                    }
                }
                .padding()
                .transition(.move(edge: .top))
            }

            // Title for featured courses
            Text("Featured Courses")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 20)
                .foregroundColor(AppColors.primaryRed)

            // ScrollView for featured courses
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(1...5, id: \.self) { index in
                        CourseCard(courseIndex: index)
                    }
                }
                .padding(.horizontal, 15)
            }
            .padding(.top)

            Spacer()
        }
        .padding()
        .background(AppColors.backgroundWhite)
        .onAppear {
            // Show announcements when the view appears
            withAnimation {
                showAnnouncements = true
            }
        }
    }
}

struct AnnouncementView: View {
    let message: String
    var dismissAction: () -> Void

    var body: some View {
        HStack {
            Text(message)
                .foregroundColor(.white)
                .padding()
                .background(AppColors.primaryRed)
                .cornerRadius(8)
            Spacer()
            Button(action: dismissAction) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.white)
            }
        }
        .padding()
        .shadow(radius: 5)
    }
}

struct CourseCard: View {
    var courseIndex: Int

    var body: some View {
        VStack {
            Image("course\(courseIndex)") // Placeholder image name
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(15)
                .shadow(radius: 5)
            Text("Course \(courseIndex)")
                .foregroundColor(.primary)
                .font(.headline)
                .padding(.top, 5)
        }
        .frame(width: 150)
        .background(Color.white)
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1) // Add border
        )
        .shadow(radius: 5)
        .padding(.bottom, 10)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
