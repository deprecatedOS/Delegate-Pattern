//
//  SelectionViewModel.swift
//  DeprecatedBootcamp
//
//  Created by Erdem on 31.03.2024.
//

import UIKit

final class SelectionViewModel {
    private let colors = [
        UIColor.red,
        UIColor.yellow,
        UIColor.black,
        UIColor.green,
        UIColor.orange,
        UIColor.purple,
        UIColor.gray

    ]
    private let images = [
        UIImage(resource: .aragorn),
        UIImage(resource: .legolas),
        UIImage(resource: .frodo),
        UIImage(resource: .gandalf),

    ]
    
    func returnRandomColor() -> UIColor {
        guard let randomElement = colors.randomElement() else {return UIColor.white}
        return randomElement
    }
    func returnRandomImage() -> UIImage {
        guard let randomElement = images.randomElement() else {return UIImage()}
        return randomElement
    }
    
}
