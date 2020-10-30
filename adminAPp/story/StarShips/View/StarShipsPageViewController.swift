//
//  StarShipsPageViewController.swift
//  adminAPp
//
//  Created by Ulvi Bashirov on 10/7/20.
//

import UIKit

class StarShipsPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var starshipsTableView: UITableView!
    
    let activity: UIActivityIndicatorView =  {
        let view = UIActivityIndicatorView()
        view.style = .large
        view.backgroundColor = .white
        view.hidesWhenStopped = true


        return view
    }()
    
    var starshipData: StarShip?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activity.frame = self.view.bounds
        self.view.addSubview(activity)
        
        starshipsTableView.dataSource = self
        starshipsTableView.delegate = self
        getStarshipData()
    }
    
    func getStarshipData() {
        activity.startAnimating()
        API.getDataFromApi { (starship) in
            self.starshipData = starship
            DispatchQueue.main.async {
                self.starshipsTableView.reloadData()
                self.activity.stopAnimating()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starshipData?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "starshipsCell", for: indexPath) as! StarShipsTableViewCell
        guard let data = starshipData else { return UITableViewCell() }
        cell.nameLabel.text = data.results?[indexPath.row].name
        cell.modelLabel.text = data.results?[indexPath.row].model
        cell.countLabel.text = data.results?[indexPath.row].passengers
        return cell
    }
    

}
