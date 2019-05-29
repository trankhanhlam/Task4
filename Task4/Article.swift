import Foundation
import UIKit

class Article {
    var article_id: String
    var title: String
    var infomation_type: String
    var main_image: String
    var publish_at: String
    var width: String
    var height: String
    
    init(article_id: String, title: String, infomation_type: String, main_image: String, publish_at: String, width: String, height: String) {
        self.article_id  = article_id
        self.title = title
        self.infomation_type = infomation_type
        self.main_image = main_image
        self.publish_at = publish_at
        self.width = width
        self.height = height
    }
}
