import SwiftUI

struct ArticleCellView: View {

    let article: ArticleModel

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: article.smallImageURL ?? "")) { image in
                image
                    .resizable()
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75, height: 75)
            } placeholder: {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 75, height: 75)
            }

            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.headline)
                Text(article.description)
                    .font(.subheadline)
                    .lineLimit(2)
            }
            .padding(.vertical, 10)
        }
    }
}

#Preview {
    ArticleCellView(article: ArticleModel(id: 1, title: "Hello", description: "Article", publishedDate: "1", author: "22", webURL: "http"))
}
