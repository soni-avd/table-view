//
//  Post.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//
import UIKit

struct Post {
    
    let title: String
}
struct PostInfo {
    let author: String
    let description: String
    let image: UIImage
    let likes: Int
    let views: Int
}
struct PhotoProfile {
    let label: String
    let photo1: UIImage
    let photo2: UIImage
    let photo3: UIImage
    let photo4: UIImage
}
struct Storage {
    static let tableModel = [
        PostInfo(author: "Elton John",
                 description: "She packed my bags last night pre-flight, \nZero hour, nine a.m. \nAnd I'm gonna be high as a kite by then \nI miss the earth so much, I miss my wife. \nIt's lonely out in space \nOn such a timeless flight",
                 image: #imageLiteral(resourceName: "rocket"),
                 likes: 245,
                 views: 300),
        PostInfo(author: "Fredie Mercury",
                 description: "Is this the real life? Is this just fantasy? \nCaught in a landslide, no escape from reality. \nOpen your eyes, look up to the skies and see, \nI'm just a poor boy, I need no sympathy, \nBecause I'm easy come, easy go, little high, little low, \nAnyway the wind blows doesn't really matter to me, to me.",
                 image: #imageLiteral(resourceName: "freddie"),
                 likes: 345,
                 views: 458),
        PostInfo(author: "George Roger Waters",
                 description: "We don't need no education. \nWe don't need no thought control. \nNo dark sarcasm in the classroom. \nTeacher, leave those kids alone. \nHey, Teacher, leave those kids alone! \nAll in all it's just another brick in the wall. \nAll in all you're just another brick in the wall",
                 image: #imageLiteral(resourceName: "pink"),
                 likes: 450,
                 views: 479),
        PostInfo(author: "John Lennon",
                 description: "There's nothing you can do that can't be done \nNothing you can sing that can't be sung \nNothing you can say but you can learn how to play the game \nIt's easy \nNothing you can make that can't be made \nNo one you can save that can't be saved \nNothing you can do but you can learn how to be you in time \nIt's easy \nAll you need is love",
                 image: #imageLiteral(resourceName: "john"),
                 likes: 1020,
                 views: 1500)
    ]
}

struct StoragePhotoProfile {
    static let tableModel = PhotoProfile(label: "Photos", photo1: #imageLiteral(resourceName: "1.jpg"), photo2: #imageLiteral(resourceName: "2.jpg"), photo3: #imageLiteral(resourceName: "3.jpg"), photo4: #imageLiteral(resourceName: "4.jpg"))
    
}
