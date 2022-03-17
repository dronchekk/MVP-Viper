//
//  SearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Rubtsov on 28.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class SearchPresenter {
    
    weak var viewInput: (UIViewController & SearchViewInput)?
    
    private let searchService = ITunesSearchService()
    
    private func requestApps(with query: String) {
        self.searchService.getApps(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            result
                .withValue { apps in
                    guard !apps.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = apps
                }
                .withError {
                    self.viewInput?.showError(error: $0)
                }
        }
    }
    
    private func openAppDetails(with app: ITunesApp) {
        let appDetailViewController = AppDetailViewController(app: app)
        viewInput?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }
}


// MARK: - SearchViewOutput

extension SearchPresenter: SearchViewOutput {
    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        self.requestApps(with: query)
    }
    
    func viewDidSelectApp(_ app: ITunesApp) {
        self.openAppDetails(with: app)
    }
}
