//
//  Community.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 24/01/25.
//

import Foundation

import Foundation

struct CommunityPost {
    var id: UUID
    var profileImage: String
    var userName: String
    var time: Date
    var plantImage: String
    var comment: String
    var likes: Int
}

class CommunityModel {
    private var posts: [CommunityPost] = []

    static var shared: CommunityModel = CommunityModel()

    private init() {
        self.posts = [CommunityPost(
            id: UUID(),
            profileImage: "profile1.png",
            userName: "JohnDoe",
            time: Date(),
            plantImage: "plant1.png",
            comment: "Look at my beautiful Monstera plant!",
            likes: 0
        )]
    }

    // Add a new community post
    func addPost(profileImage: String, userName: String, plantImage: String, comment: String) {
        let newPost = CommunityPost(
            id: UUID(),
            profileImage: profileImage,
            userName: userName,
            time: Date(),
            plantImage: plantImage,
            comment: comment,
            likes: 0
        )
        print("Post added successfully.")
        posts.append(newPost)
        
    }

    // Get all posts
    func getAllPosts() -> [CommunityPost] {
//        posts.append(contentsOf: dummyPost())
        return posts
    }

    // Get a specific post by ID
    func getPostById(postId: UUID) -> CommunityPost? {
        return posts.first(where: { $0.id == postId })
    }

    // Like a post
    func likePost(postId: UUID) {
        if let index = posts.firstIndex(where: { $0.id == postId }) {
            posts[index].likes += 1
            print("Post liked successfully.")
        } else {
            print("Post not found.")
        }
    }

    // Add a comment to a post
    func addComment(postId: UUID, newComment: String) {
        if let index = posts.firstIndex(where: { $0.id == postId }) {
            posts[index].comment += "\n\(newComment)"
            print("Comment added successfully.")
        } else {
            print("Post not found.")
        }
    }

    // Get all posts by a specific user
    func getPostsByUser(userName: String) -> [CommunityPost] {
        return posts.filter { $0.userName == userName }
    }

    // Delete a post
    func deletePost(postId: UUID) {
        if let index = posts.firstIndex(where: { $0.id == postId }) {
            posts.remove(at: index)
            print("Post deleted successfully.")
        } else {
            print("Post not found.")
        }
    }
    func dummyPost() -> [CommunityPost] {
        let post1 = CommunityPost(
            id: UUID(),
            profileImage: "profile1.png",
            userName: "JohnDoe",
            time: Date(),
            plantImage: "plant1.png",
            comment: "Look at my beautiful Monstera plant!",
            likes: 0
        )
        
//        let post2 = CommunityPost(
//            id: UUID(),
//            profileImage: "profile2.png",
//            userName: "JaneSmith",
//            time: Date(),
//            plantImage: "plant2.png",
//            comment: "Just added a new cactus to my collection 🌵",
//            likes: 0
//        )
//        
//        let post3 = CommunityPost(
//            id: UUID(),
//            profileImage: "profile3.png",
//            userName: "PlantLover",
//            time: Date(),
//            plantImage: "plant3.png",
//            comment: "My peace lily is finally blooming! ❤️",
//            likes: 0
//        )
//        
//        let post4 = CommunityPost(
//            id: UUID(),
//            profileImage: "profile4.png",
//            userName: "GreenThumb",
//            time: Date(),
//            plantImage: "plant4.png",
//            comment: "Propagated this pothos last month. It's growing so well!",
//            likes: 0
//        )
//        
//        let post5 = CommunityPost(
//            id: UUID(),
//            profileImage: "profile5.png",
//            userName: "NatureFan",
//            time: Date(),
//            plantImage: "plant5.png",
//            comment: "Sharing a pic of my herb garden 🌱 Basil and mint are thriving!",
//            likes: 0
//        )
        
        let dummyPosts = [post1]
//        posts.append(contentsOf: dummyPosts)
        return dummyPosts
    }
}





