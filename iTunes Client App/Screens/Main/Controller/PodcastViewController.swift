//
//  PodcastViewController.swift
//  iTunes Client App
//
//  Created by Muhammed Yusuf Kaynak on 8.10.2022.
//


import UIKit

final class PodcastViewController: UIViewController {
    
    // MARK: - Properties
    private let mainView = PodcastView()
    private let networkService = BaseNetworkService()
    private var podcastResponse: PodcastResponse? {
        didSet {
            mainView.refresh()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Podcasts"
        view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Education, Fun..."
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        fetchPodcasts()
        
    }
    
    // MARK: - Methods
    private func fetchPodcasts(with text: String = "Podcast") {
        networkService.request(PodcastRequest(searchText: text)) { result in
            switch result {
            case .success(let response):
                self.podcastResponse = response
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
   
}



// MARK: - UICollectionViewDelegate
extension PodcastViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.podcast = podcastResponse?.results?[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension PodcastViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        podcastResponse?.resultCount ?? .zero

    }
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ApiCollectionViewCell
        let podcast = podcastResponse?.results?[indexPath.row]
        cell.title = podcast?.trackName
        cell.imageView.downloadImage(from: podcast?.artworkLarge)
        return cell
    }
 
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }
}
// MARK: - UISearchResultsUpdating
extension PodcastViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            fetchPodcasts(with: text)
        }
    }
}
