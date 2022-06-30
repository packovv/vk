//
//  FeedViewController.swift
//  vk
//
//  Created by packovv on 01.06.2022.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIManager.shared.getPost(id: "post1", imageId: "Desert") { res1 in
            self.posts.append(res1!)
            APIManager.shared.getPost(id: "post2", imageId: "Desert") { res2 in
                self.posts.append(res2!)
                APIManager.shared.getPost(id: "post3", imageId: "Desert") { res3 in
                    self.posts.append(res3!)
                    DispatchQueue.main.async {
                        self.table.reloadData()
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! FeedTableViewCell
        
        cell.postName.text = posts[indexPath.row].name
        cell.postDate.text = posts[indexPath.row].date
        cell.postText.text = posts[indexPath.row].text
        cell.postImage.image = posts[indexPath.row].image
        
        return cell
    }

}
