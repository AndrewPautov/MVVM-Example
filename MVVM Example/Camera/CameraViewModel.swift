//
//  CameraViewModel.swift
//  MVVM Example
//
//  Created by Андрей Паутов on 03.03.2023.
//

import AVFoundation
import Foundation
import UIKit

class CameraViewModel {
    let userDefaults = UserDefaults.standard
    let dbManager = DBService()
}

// MARK: - CameraViewModelProtocol
extension CameraViewModel: CameraViewModelProtocol {
    var isFlashEnabled: Bool {
        get {
            userDefaults.bool(forKey: "isFlashEnabled")
        }
        set {
            userDefaults.set(newValue, forKey: "isFlashEnabled")
        }
    }
    
    var isLivePhotoEnabled: Bool {
        get {
            userDefaults.bool(forKey: "isLivePhotoEnabled")
        }
        set {
            userDefaults.set(newValue, forKey: "isLivePhotoEnabled")
        }
    }
    
    var isWideScreenAvailable: Bool {
        if let _ = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) {
            return true
        } else {
            return false
        }
    }
    
    var isWideScreenEnabled: Bool {
        get {
            userDefaults.bool(forKey: "isWideScreenEnabled")
        }
        set {
            userDefaults.set(newValue, forKey: "isWideScreenEnabled")
        }
    }
    
    var isCameraFlipAvailable: Bool {
        if #available(iOS 3.0, *) {
            return true
        } else {
            return false
        }
    }
    
    func getAvailableCameraModes() -> [CameraMode] {
        var modes = [CameraMode]()
        modes.append(.photo)
        modes.append(.video)
        if let _ = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back) {
            modes.append(.portrait)
        }
        if #available(iOS 11.0, *) {
            modes.append(.slowMotion)
        }
        modes.append(.panorama)
        return modes
    }
    
    func getRecentImage() -> UIImage? {
        dbManager.getRecentImage()
    }
    
    
}
