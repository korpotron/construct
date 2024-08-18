import Construct
import SwiftUI

struct ProductsView: View {
    @State var path = NavigationPath()
    @ObservedObject var repository = ProductRepository()

    var body: some View {
        NavigationStack(path: $path) {
            ConstructView(for: ProductsPlaceholder.list)
                .navigationDestination(for: ProductsPlaceholder.self) { link in
                    ConstructView(for: link)
                }
        }
        .environmentObject(repository)
    }
}

#Preview {
    ProductsView()
}
