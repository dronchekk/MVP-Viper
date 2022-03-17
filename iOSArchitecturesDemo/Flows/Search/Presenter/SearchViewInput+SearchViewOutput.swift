//
//  SearchViewInput+SearchViewOutput.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Rubtsov on 28.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation

protocol SearchViewInput: class {
    var searchResults: [ITunesApp] { get set }
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
}

protocol SearchViewOutput: class {
    func viewDidSearch(with query: String)
    func viewDidSelectApp(_ app: ITunesApp)
}
