//
//  MainViewController.swift
//  iTunes Client App
//
//  Created by Pazarama iOS Bootcamp on 1.10.2022.
//

import UIKit

final class MainViewController: UIViewController {
    let categories: Array = [
        "Movie",
        "Podcast",
        "Music",
        "Software",
        "E-book"
    ]
    
    let urls: Array = [
    "https://img.freepik.com/free-psd/cinema-time-with-3d-glasses-popcorn_23-2148470121.jpg?w=1380&t=st=1665431914~exp=1665432514~hmac=0ece2b0021036e66c0767fba6d641bad31b76604bf7a58d33bc5fee931f58f4b",
    "https://img.freepik.com/free-vector/talking-microphone-logo-template_23-2148789042.jpg?w=1380&t=st=1665432148~exp=1665432748~hmac=fd5b1d3187568fb381e2741a815b97616c055d77c747a80ea995b9eb68bf0f62",
    "https://img.freepik.com/free-psd/rose-gold-media-player-mockup-rose-gold-3d-media-player-mockup_106244-1745.jpg?w=1800&t=st=1665431964~exp=1665432564~hmac=35e83e995319cd85a4e68f9d0b09c0e500555b9b4dbb8646ef7da4d522abd411",
    "https://img.freepik.com/premium-vector/software-development-improvement-buttons_316839-3551.jpg",
    "https://img.freepik.com/free-vector/library-concept-with-online-reading-ebooks-symbols-isometric_1284-33405.jpg?w=1380&t=st=1665432211~exp=1665432811~hmac=3b0a5ed725f4fa6f56e419b69b9eae26a9bf32236efd8b95b17396578c846472",
    
    ]
    
    // MARK: - Properties
    private let mainView = MainView()

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Network API"
        view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO: kategoriye yönlendirme
        if(indexPath.row == 0){
            let movieViewController = MovieViewController()
            navigationController?.pushViewController(movieViewController, animated: true)
        }else if(indexPath.row == 1){
            let podcastViewController = PodcastViewController()
            navigationController?.pushViewController(podcastViewController, animated: true)
        }else if(indexPath.row == 2){
            let musicViewController = MusicViewController()
            navigationController?.pushViewController(musicViewController, animated: true)
        }else if(indexPath.row == 3){
            let softwareViewController = SoftwareViewController()
            navigationController?.pushViewController(softwareViewController, animated: true)
        }else if(indexPath.row == 4){
            let ebookViewController = EbookViewController()
            navigationController?.pushViewController(ebookViewController, animated: true)
        }else {
            
        }
        
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SelectCategoryCollectionViewCell
        cell.title = categories[indexPath.row]
        cell.imageView.downloadImage(from: URL(string : urls[indexPath.row]))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }
}

