
extension Request where Response == Feed {
    static var reviewList: Request<Feed> {
        Request(
            path: "nl/rss/customerreviews/id=474495017/sortby=mostrecent/json",
            httpMethod: .get,
            decoder: decode
        )
    }
}
