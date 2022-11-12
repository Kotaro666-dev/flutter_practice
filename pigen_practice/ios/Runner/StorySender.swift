//
// Created by Kotaro Kamashima on 2022/11/12.
//

import Foundation

class StorySenderApi: NSObject, HostStoryApi {
    func respond() -> Story? {
        let comments = [
            Comment(user: "John", body: "Excellent Story!!"),
            Comment(user: "Alice", body: "What a beautiful story!"),
            Comment(user: "Adam", body: "You are an amazing writer."),
        ]
        let story = Story(title: "Never let me go", author: "K.K", comments: comments, rates: 9.7, year: 2005, isFavorite: true)
        return story
    }
}