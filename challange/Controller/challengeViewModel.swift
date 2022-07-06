//
//  challengeViewModel.swift
//  challange
//
//  Created by Onur on 6.07.2022.
//

import Foundation

class challengeViewModel {
    
    var challengeModel: DataModel?
    var cellViewModels: [challengeTableCellViewModel] = []

        func getAllFilms(completion: @escaping ()-> ()){
            
            if let url = URL(string: "https://api.themoviedb.org/3/tv/popular?api_key=d5cbe3eb873c9d89f08d104dfe2c4626&language=en-US&page=1") {
               URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
            let jsonDecoder = JSONDecoder()
            do {
                let jsonData = try jsonDecoder.decode(DataModel.self, from: data)
                self.challengeModel = jsonData
                
                self.challengeModel?.results.forEach({ departure in
                    let cellViewModel = challengeTableCellViewModel(departure: departure!)
                    self.cellViewModels.append(cellViewModel)
                })
                
                completion()
                    } catch {
                        print("error:\(error)")
                    }
                }
            }.resume()
        }
    }
}
