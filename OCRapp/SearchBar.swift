import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("Search...", text: $searchText)
                .padding(10)
                .background(Color.red.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal, 10)
            
            Button(action: {
                // Action to perform search
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.red)
            }
            .padding(.trailing, 10)
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    @State static var searchText = ""
    
    static var previews: some View {
        SearchBar(searchText: $searchText)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
