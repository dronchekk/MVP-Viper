//
//  ThreadSaveMemoryCache.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey Rachitskiy on 10.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class ThreadSaveMemoryCache {

    static let shared = ThreadSaveMemoryCache()

    private let queue = DispatchQueue(label: "ru.itunes-search.image", attributes: .concurrent)
    private var cache: [URL: UIImage] = [:]

    private init() {}

    func get(for key: URL) -> UIImage? {
        var image: UIImage?
        queue.sync {
            image = cache[key]
        }
        return image
    }

    func get(for key: String) -> UIImage? {
        guard let key = URL(string: key) else { return nil }

        var image: UIImage?
        queue.sync {
            image = cache[key]
        }
        return image
    }

    func set(for url: URL, image: UIImage) {
        queue.async(flags: .barrier) {
            self.cache[url] = image
        }
    }
}
