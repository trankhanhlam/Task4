import Foundation
import UIKit


class Helper {
    static var shared: Helper = {
        let shared = Helper()
        return shared
    }()
    
    func connectToJson(completion: @escaping ([Article])->Void) {
        var listArt: [Article] = []
        guard let path = Bundle.main.path(forResource: "IN101_response_2", ofType: "json") else {return}
        let jsonData: Data = NSData.dataWithContentsOfMappedFile(path) as! Data
        do {
            let jsonDict = try JSONSerialization.jsonObject(with: jsonData) as! [String: AnyObject]
            let arrArt = jsonDict["article_list"] as! [[String:AnyObject]]
            
            for artice in arrArt {
                let title = artice["title"] as! String
                let article_id = artice["article_id"] as! String
                let height  = artice["height"] as! String
                let width = artice["width"] as! String
                let main_image = artice["main_image"] as! String
                let information_type = artice["information_type"] as! String
                let publish_at = artice["publish_at"] as! String
                let article = Article(article_id: article_id, title: title, infomation_type: information_type, main_image: main_image, publish_at: publish_at, width: width, height: height)
                listArt.append(article)
            }
            completion(listArt)
        } catch {
            completion([])
        }
    }
}
