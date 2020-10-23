//
//  File.swift
//  
//
//  Created by Serhan Aksut on 23.10.2020.
//

import NetworkCore
import AppstoreAPI

public extension Request where Response == [Review] {
    static var reviewList: Request<[Review]> {
        Request(
            path: "nl/rss/customerreviews/id=474495017/sortby=mostrecent/json",
            httpMethod: .get,
            decoder: decode
        )
    }
}
