//
//  ViewController.swift
//  TableViewProject
//
//  Created by erumaru on 4/4/20.
//  Copyright © 2020 kbtu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    lazy var refreshControl: UIRefreshControl = {
        let view = UIRefreshControl()
        view.addTarget(self, action: #selector(downloadMovies), for: .valueChanged)
        
        return view
    }()
    
    // MARK: - Variables
    var movies: [Movie] = []
    
    // MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.refreshControl = refreshControl
        downloadMovies()
    }
    
    // MARK: - Actions
    @objc func downloadMovies() {
        MovieService.shared.downloadMovies { response in
            self.movies = response.movies
            self.tableView.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movie", for: indexPath) as! MovieTableViewCell
        cell.movie = self.movies[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
    }
}
