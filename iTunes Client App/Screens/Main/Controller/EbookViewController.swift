//
//  EbookViewController.swift
//  iTunes Client App
//
//  Created by Muhammed Yusuf Kaynak on 10.10.2022.
//

import UIKit

final class EbookViewController: UIViewController {
    
    // MARK: - Properties
    private let mainView = EbookView()
    private let networkService = BaseNetworkService()
    private var ebookResponse: EbookResponse? {
        didSet {
            mainView.refresh()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ebooks"
        view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Education, Fun..."
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        fetchEbooks()
        
    }
    
    // MARK: - Methods
    private func fetchEbooks(with text: String = "Ebook") {
        networkService.request(EbookRequest(searchText: text)) { result in
            switch result {
            case .success(let response):
                self.ebookResponse = response
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
   
}



// MARK: - UICollectionViewDelegate
extension EbookViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.ebook = ebookResponse?.results?[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension EbookViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ebookResponse?.resultCount ?? .zero

    }
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ApiCollectionViewCell
        let ebook = ebookResponse?.results?[indexPath.row]
        cell.title = ebook?.trackName
        cell.imageView.downloadImage(from: ebook?.artworkLarge)
        return cell
    }
 
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }
}
// MARK: - UISearchResultsUpdating
extension EbookViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            fetchEbooks(with: text)
        }
    }
}
