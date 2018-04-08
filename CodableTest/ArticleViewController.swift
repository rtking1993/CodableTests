// MARK: Frameworks

import UIKit

// MARK: ArticleViewController

class ArticleViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet var myTableView: UITableView!
    
    // MARK: Variables
    
    var articles: [Article] = []
    
    // MARK: View Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ArticleRemote.retrieveArticles { articles in
            self.articles = articles.results
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        }
    }
}

// MARK: UITableViewDataSource Methods

extension ArticleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        let article = articles[indexPath.row]
        cell.textLabel?.text = article.title
        return cell
    }
}

// MARK: UITableViewDelegate Methods

extension ArticleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        openURL(article.url)
    }
    
    // MARK: Helper Methods
    
    private func openURL(_ url: URL) {
        guard UIApplication.shared.canOpenURL(url) == true else {
            return
        }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
