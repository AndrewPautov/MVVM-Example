//
//  CameraViewModelProtocol.swift
//  MVVM Example
//
//  Created by Андрей Паутов on 03.03.2023.
//

import UIKit

protocol CameraViewModelProtocol {
    var isFlashEnabled: Bool { get set }
    var isLivePhotoEnabled: Bool { get set }
    var isWideScreenAvailable: Bool { get }
    var isWideScreenEnabled: Bool { get set }
    var isCameraFlipAvailable: Bool { get }
    
    func getAvailableCameraModes() -> [CameraMode]
    func getRecentImage() -> UIImage?
}
