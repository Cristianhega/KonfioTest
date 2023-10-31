//
//  HomeInteractor.swift
//  KonfioApp
//
//  Created by Cristian Hernandez Garcia on 30/10/23.
//

import UIKit

class  HomeInteractor: HomeInteractorProtocol {
    weak var presenter: HomeOutputInteractorProtocol?
    
    func getDogsData(from view: UIViewController) {
        guard let url = URL(string: Constants.baseUrl) else {
            self.presenter?.retry()
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = Constants.get
        
        URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            guard let self = self else { return }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let dogs = try JSONDecoder().decode([Dog].self, from: data)
                        self.handleSuccess(dogs: dogs)
                    } catch {
                        self.handleError(error)
                    }
                }
            } else {
                self.handleError(error)
            }
        }.resume()
    }
    
    private func handleSuccess(dogs: [Dog]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.saveData(dogs: dogs)
            self.presenter?.sendInfo(dogs: dogs)
        }
    }

    private func handleError(_ error: Error?) {
        print("Error in fetching dogs data: \(error?.localizedDescription ?? "Unknown error")")
        self.presenter?.retry()
    }
    
    func saveData(dogs: [Dog]) {
        let dogManager = DogManager()
        dogManager.saveDogsFromService(dogs: dogs)
    }
}
