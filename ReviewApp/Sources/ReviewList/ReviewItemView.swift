//
//  ReviewItemView.swift
//  ReviewApp
//
//  Created by Alperen Duran on 27.01.2021.
//

import SwiftUI

struct ReviewItemView: View {
    let review: Review
    var body: some View {
        HStack {
            VStack(
                alignment: .leading,
                spacing: 5.0
            ) {
                Text(review.ratingVersionText)
                    .font(.system(size: 18.0))
                    .lineLimit(1)
                
                Text(review.authorText)
                    .font(.system(size: 15.0))
                    .lineLimit(1)
                
                Text(review.title)
                    .font(
                        .system(
                            size: 16.0,
                            weight: .bold,
                            design: .default
                        )
                    )
                    .lineLimit(2)
                
                Text(review.content)
                    .font(.system(size: 14.0))
                    .lineLimit(3)
            }
            
            Spacer()
        }.padding(.horizontal)
        .padding(.vertical, 5)
    }
}

struct ReviewItemView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewItemView(
            review: Review(
                id: "",
                author: "Alperen",
                rating: 5,
                title: "Çok faydalı bir uygulama",
                content: "Ben çok beğendim herkese öneririm",
                version: "5.10"
            )
        )
    }
}
