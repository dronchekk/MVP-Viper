//
//  AppDetailConstants.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey Rachitskiy on 11.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

struct AppDetailConstants {

    static let leftIndent: CGFloat = 16.0
    static let rightIndent: CGFloat = -16.0

    static let headerViewSize: CGFloat = 140.0
    static let infoViewSize: CGFloat = 55.0
    static let whatsNewViewSize: CGFloat = 80

    private static var _optimalSize: CGSize?

    static func getOptimalSize() -> CGSize {
        if let optimalSize = _optimalSize {
            return optimalSize
        }

        let photoWidth: CGFloat = 392
        let photoHeight: CGFloat = 696
        let ratio = photoHeight / photoWidth

        let width = UIScreen.main.bounds.width
        let third = (width / 2) - (16 * 2)

        let sizeWidthPhoto = width - third
        let sizeHeightPhoto = sizeWidthPhoto * ratio

        let size = CGSize(width: sizeWidthPhoto, height: sizeHeightPhoto)

        _optimalSize = size

        return size
    }
}
