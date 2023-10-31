//
//  HomePresenter.swift
//  KonfioApp
//
//  Created by Cristian Hernandez Garcia on 30/10/23.
//

import UIKit

class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    var presenter: HomePresenterProtocol?
    var router: HomeRouterProtocol?
    
    func fetchDogs() {
        let dogManager = DogManager()
        if dogManager.hasDataInCoreData() {
            let dogs = dogManager.getDogsFromCoreData()
            router?.pushToDetailView(from: view as! UIViewController, dogs: dogs)
        } else {
            interactor?.getDogsData(from: view as! UIViewController)
        }
    }
    
    func showLoader() {
        view?.showLoader()
    }
    
    func hideLoader() {
        view?.hideLoader()
    }
    
    func disableButton() {
        view?.disableButton()
    }
    
    func enableButton() {
        view?.enableButton()
    }
}

extension HomePresenter: HomeOutputInteractorProtocol {
    func retry() {
        hideLoader()
        enableButton()
    }
    
    func sendInfo(dogs: [Dog]) {
        router?.pushToDetailView(from: view as! UIViewController, dogs: dogs)
    }
}
