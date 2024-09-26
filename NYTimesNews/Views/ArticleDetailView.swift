import SwiftUI

struct ArticleDetailView: View {

    let article: ArticleModel

    var body: some View {
        VStack {
            HStack {
                Text(article.author)
                Spacer()
                Text(article.imageURL ?? "")
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
            }
            .padding()
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ArticleDetailView(article: ArticleModel(id: 1, title: "Title", description: "Hello", publishedDate: "22/22/2222", author: "Dima"))
}
