//
//  ReviewListUI.swift
//  ReviewApp
//
//  Created by Alperen Duran on 27.01.2021.
//

import SwiftUI

struct ReviewList: View {
    let store = ReviewStore()
    @State var reviews: [Review] = []
    @State var showError = false
    
    var body: some View {
        NavigationView {
            List(reviews) { review in
                ReviewItemView(review: review)
            }.navigationBarTitle(
                "Review List",
                displayMode: .inline
            )
        }
        .onAppear {
            store.fetchReviewList { result in
                switch result {
                case .success(let reviews):
                    self.reviews = reviews
                case .failure(_):
                    self.showError = true
                }
            }
        }
        .alert(isPresented: $showError) {
            Alert(
                title: Text("Error"),
                message: Text("An Error Occured")
            )
        }
    }
}

struct ReviewListUI_Previews: PreviewProvider {
    static var previews: some View {
        ReviewList()
    }
}
