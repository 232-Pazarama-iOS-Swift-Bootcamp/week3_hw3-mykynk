//
//  DetailViewController.swift
//  iTunes Client App
//
//  Created by Pazarama iOS Bootcamp on 2.10.2022.
//

import UIKit

final class DetailViewController: UIViewController {
    
    var podcast: Podcast? {
        didSet {
            title = podcast?.trackName
            detailView.imageView.downloadImage(from: podcast?.artworkLarge)
            detailView.releaseDate = podcast?.releaseDate
            detailView.artistName = podcast?.artistName
            detailView.country = podcast?.country
            detailView.genres = podcast?.genres?.reduce("") { $1 + ", " + $0 }
        }
    }
    
    var music: Music? {
        didSet {
            title = music?.trackName
            detailView.imageView.downloadImage(from: music?.artworkLarge)
            detailView.releaseDate = music?.releaseDate
            detailView.artistName = music?.artistName
            detailView.country = music?.country
            detailView.genres = music?.genres?.reduce("") { $1 + ", " + $0 }
        }
    }
    
    var software: Software? {
        didSet {
            title = software?.trackName
            detailView.imageView.downloadImage(from: software?.artworkLarge)
            detailView.releaseDate = software?.releaseDate
            detailView.artistName = software?.artistName
            detailView.country = software?.country
            detailView.genres = software?.genres?.reduce("") { $1 + ", " + $0 }
        }
    }
   
    var ebook: Ebook? {
        didSet {
            title = ebook?.trackName
            detailView.imageView.downloadImage(from: ebook?.artworkLarge)
            detailView.releaseDate = ebook?.releaseDate
            detailView.artistName = ebook?.artistName
            detailView.country = ebook?.country
            detailView.genres = ebook?.genres?.reduce("") { $1 + ", " + $0 }
        }
    }
    
    var movie: Movie? {
        didSet {
            title = ebook?.trackName
            detailView.imageView.downloadImage(from: movie?.artworkLarge)
            detailView.releaseDate = movie?.releaseDate
            detailView.artistName = movie?.artistName
            detailView.country = movie?.country
            detailView.genres = movie?.genres?.reduce("") { $1 + ", " + $0 }
        }
    }


    
    private let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
    }
}
