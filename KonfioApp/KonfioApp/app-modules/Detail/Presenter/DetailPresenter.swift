//
//  DetailPresenter.swift
//  KonfioApp
//
//  Created by Cristian Hernandez Garcia on 30/10/23.
//

import UIKit

class DetailPresenter: DetailPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorProtocol?
    var presenter: DetailPresenterProtocol?
    var router: DetailRouterProtocol?
}

extension DetailPresenter: DetailOutputInteractorProtocol {
    
}
