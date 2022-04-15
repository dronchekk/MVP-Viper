//
//  SongCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey Rachitskiy on 11.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

struct SongCellModel {
    let songTitle: String
    let coverPhoto: String?
}

final class SongCellModelFactory {

    static func cellModel(from model: ITunesSong) -> SongCellModel {
        var songTitle: String = ""
        if let artistName = model.artistName {
            songTitle = "\(artistName) - "
        }

        songTitle += model.trackName

        return SongCellModel(songTitle: songTitle, coverPhoto: model.smallArtwork)
    }
}
