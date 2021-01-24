
extension Request where Response == Feed {
    static var reviewList: Request<Feed> {
        Request(
            path: "/tr/rss/customerreviews/id=375380948/sortby=mostrecent/json",
            httpMethod: .get,
            decoder: decode
        )
    }
}
