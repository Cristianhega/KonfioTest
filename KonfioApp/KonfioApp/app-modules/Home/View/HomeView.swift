//
//  ViewController.swift
//  KonfioApp
//
//  Created by Cristian Hernandez Garcia on 30/10/23.
//

import UIKit

class HomeView: UIViewController {
    
    var presenter: HomePresenterProtocol?
    
    private lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .yellow
        indicator.isHidden = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.searchPets, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: .seventeen)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.layer.borderWidth = .two
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = .fifteen
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(search),
                         for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        configUI()
        setAutoLayout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        presenter?.hideLoader()
        presenter?.enableButton()
    }
    
    private func configUI() {
        navigationItem.hidesBackButton = true
        navigationItem.backBarButtonItem = UIBarButtonItem(title: Constants.empty)
        view.backgroundColor = UIColor(hex: Constants.konfioPurple)
        view.addSubview(searchButton)
        view.addSubview(indicator)
    }
    
    private func setAutoLayout() {
        NSLayoutConstraint.activate([
            searchButton.heightAnchor.constraint(equalToConstant: .fifty),
            searchButton.widthAnchor.constraint(equalToConstant: .twoHundredHalf),
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                 constant: -.twoHundredHalf),
            
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func search() {
        presenter?.disableButton()
        presenter?.showLoader()
        presenter?.fetchDogs()
    }
}

extension HomeView: HomeViewProtocol {
    
    func showLoader(){
        indicator.isHidden = false
        indicator.startAnimating()
    }
    
    func hideLoader() {
        indicator.stopAnimating()
        indicator.isHidden = true
    }
    
    func disableButton() {
        searchButton.isUserInteractionEnabled = false
    }
    
    func enableButton() {
        searchButton.isUserInteractionEnabled = true
    }
}
