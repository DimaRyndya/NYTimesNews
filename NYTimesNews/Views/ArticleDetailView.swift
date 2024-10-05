import SwiftUI

struct ArticleDetailView: View {

    let article: ArticleModel

    var body: some View {
        VStack {
//            Image("image1")
//                .resizable()
//                .clipShape(RoundedRectangle(cornerRadius: 25))
//                .aspectRatio(contentMode: .fit)
//                .padding()
            AsyncImage(url: URL(string: article.largeImageURL ?? "")) { image in
                image
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                EmptyView()
            }
            HStack {
                Text(article.author)
                Spacer()
            }
            .padding()
            Text(article.title)
                .font(.title)
            Text(article.description)
                .font(.title2)
                .multilineTextAlignment(.leading)
            HStack {
                Text("Published:")
                Text(article.publishedDate.toFormattedDate())
                Spacer()
                if let url = URL(string: article.webURL) {
                    Link(destination: url) {
                        Text("Read more")
                    }
                }
            }
            .padding()
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

#Preview {
    ArticleDetailView(article: ArticleModel(id: 1, title: "Title", description: "Hello", publishedDate: "22/22/2222", author: "Dima", webURL: "http"))
}
