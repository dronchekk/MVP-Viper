//
//  SearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Rubtsov on 28.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

protocol SearchViewInput: AnyObject {
    var searchResultApps: [ITunesApp] { get set }
    var searchResultSongs: [ITunesSong] { get set }
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
}

protocol SearchViewOutput: AnyObject {
    func viewDidSearch(with query: String, searchMode: SearchMode)
    func viewDidSelectApp(_ app: ITunesApp)
    func viewDidSelectSong(_ indexSong: Int)
}

class SearchPresenter {
    
    weak var viewInput: (UIViewController & SearchViewInput)?

    let interactor: SearchInteractorInput
         let router: SearchRouterInput

         init(interactor: SearchInteractorInput, router: SearchRouterInput) {
             self.interactor = interactor
             self.router = router
         }
    
    private func requestApps(with query: String) {
        self.interactor.requestApps(with: query) { [weak self] result in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            result.withValue { apps in
                    guard !apps.isEmpty else {
                        self.viewInput?.searchResultApps = []
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResultApps = apps
                }
                .withError {
                    self.viewInput?.showError(error: $0)
                }
        }
    }

    private func requestSongs(with query: String) {
        self.interactor.requestApps(with: query) { [weak self] result in
            guard let self = self else { return }

            self.viewInput?.throbber(show: false)

            result.withValue { songs in
                guard !songs.isEmpty else {
                    self.viewInput?.searchResultSongs = []
                    self.viewInput?.showNoResults()
                    return
                }
                self.viewInput?.hideNoResults()
                self.viewInput?.searchResultSongs = songs
            }
            .withError {
                self.viewInput?.showError(error: $0)
            }
        }
    }
}


// MARK: - SearchViewOutput

extension SearchPresenter: SearchViewOutput {
    func viewDidSearch(with query: String, searchMode: SearchMode) {
        switch searchMode {
        case .apps:
            requestApps(with: query)
        case .songs:
            requestSongs(with: query)
        }
    }
    
    func viewDidSelectApp(_ app: ITunesApp) {
        self.router.openDetails(for: app)
    }

    func viewDidSelectSong(_ indexSong: Int) {
        self.router.openSongDetails(for: indexSong, songs: viewInput?.searchResultSongs ?? [])
    }
}
