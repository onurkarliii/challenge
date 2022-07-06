//
//  challengeViewController.swift
//  challange
//
//  Created by Onur on 6.07.2022.
//

import UIKit

struct FilmDetail {
    let id: Int
    let firstAirDate: String
    let filmName: String
    let originalLanguage: String
    let voteAverage: String
    let overView: String
    let image: String
}

class challengeViewController: UIViewController {
    
    var FilmDetailData: [FilmDetail] = []
    var viewModel = challengeViewModel()
    @IBOutlet weak var tableView: UITableView!
    static var filmId =  0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        fetchSearchResult()
    }

    private func configureViews() {
        self.tableView.register(UINib(nibName: "challengeTableViewCell", bundle: nil), forCellReuseIdentifier: "challengeTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func fetchSearchResult() {
        
        viewModel.getAllFilms { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}


extension challengeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "challengeTableViewCell", for: indexPath) as? challengeTableViewCell else { return UITableViewCell() }
        
        let cellViewModel = viewModel.cellViewModels[indexPath.row]
        cell.viewModel = cellViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        FilmDetailData.append(FilmDetail(id: viewModel.cellViewModels[indexPath.row].departure?.id ?? 0, firstAirDate: viewModel.cellViewModels[indexPath.row].departure?.first_air_date ?? "", filmName: viewModel.cellViewModels[indexPath.row].departure?.name ?? "", originalLanguage: viewModel.cellViewModels[indexPath.row].departure?.original_language ?? "",voteAverage: String(viewModel.cellViewModels[indexPath.row].departure?.vote_average ?? 0.00), overView: viewModel.cellViewModels[indexPath.row].departure?.overview ?? "",image: viewModel.cellViewModels[indexPath.row].departure?.poster_path ?? ""))
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "challengeDetailViewController") as! challengeDetailViewController
        nextViewController.modalTransitionStyle = .crossDissolve
        nextViewController.programVar = FilmDetailData

        self.present(nextViewController, animated:true, completion:nil)
        
    }
    
}
