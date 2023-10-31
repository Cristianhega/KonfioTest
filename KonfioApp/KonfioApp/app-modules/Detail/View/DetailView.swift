//
//  DetailView.swift
//  KonfioApp
//
//  Created by Cristian Hernandez Garcia on 30/10/23.
//

import UIKit

class DetailView: UIViewController, DetailViewProtocol {
    
    var presenter: DetailPresenterProtocol?
    
    var dogs: [Dog]?
    let tableView = UITableView()
    
    override func viewDidLoad() {
        configUI()
    }
    
    private func configUI() {
        title = Constants.dogsWeLove
        view.backgroundColor = UIColor(hex: Constants.lightGray)
        navigationItem.hidesBackButton = false
        navigationController?.navigationBar.barTintColor = UIColor(hex: Constants.lightGray)
        navigationController?.navigationBar.tintColor = UIColor(hex: Constants.mediumGray)
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.frame = view.bounds
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DetailViewCell.self,
                           forCellReuseIdentifier: Constants.detailCell)
        view.addSubview(tableView)
    }
    
    private func setData(_ cell: DetailViewCell, _ dog: Dog){
        cell.nameLabel.text = dog.dogName
        cell.descriptionLabel.text = dog.description
        cell.ageLabel.text = checkYears(years: dog.age ?? .zero)
        setPhoto(cell, dog.image)
    }
    
    private func checkYears(years: Int) -> String {
        years != 1 ? Constants.almost + String(years) + Constants.years
        : Constants.almost + String(years) + Constants.year
    }
    
    private func setPhoto(_ cell: DetailViewCell, _ photo: String?) {
        guard let picture = photo,
              let url = URL(string: picture),
              let data = try? Data(contentsOf: url),
              let dogImage = UIImage(data: data) else {
            DispatchQueue.main.async {
                cell.photoView.image = UIImage()
            }
            return
        }
        DispatchQueue.main.async {
            cell.photoView.image = dogImage
        }
    }
}

extension DetailView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dogs?.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.detailCell,
                                                 for: indexPath) as! DetailViewCell
        guard let dog = dogs?[indexPath.row] else { return cell }
        setData(cell, dog)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat.twoHundredTwenty
    }
}
