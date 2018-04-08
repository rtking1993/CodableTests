// MARK: Frameworks

import Foundation

// MARK: ArticleRemote

class ArticleRemote {
    static func retrieveArticles(completion: @escaping(_ articles: Articles) -> Void) {
        let session = URLSession(configuration: .default)
        let apiURL: URL = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/Technology/1.json")!
        var request: URLRequest = URLRequest(url: apiURL)
        request.addValue("245f0d40c8d64f07bfe69265569e34a9", forHTTPHeaderField: "api-key")
        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil, let data = data else {
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let articles = try decoder.decode(Articles.self, from: data)
                completion(articles)
            } catch let error {
                print("Error: \(error)")
            }
        }
        
        task.resume()
    }
}
