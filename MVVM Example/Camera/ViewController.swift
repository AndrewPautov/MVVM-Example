//
//  ViewController.swift
//  MVVM Example
//
//  Created by Андрей Паутов on 03.03.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var flashButton: UIButton!
    @IBOutlet private var livePhotoButton: UIButton!
    
    var viewModel: CameraViewModelProtocol = CameraViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureFlashButton()
        configureLivePhotoButton()
    }
    
    @IBAction func didTapFlashButton() {
        viewModel.isFlashEnabled = !viewModel.isFlashEnabled
        configureFlashButton()
    }

    @IBAction func didTapLivePhotoButton() {
        viewModel.isLivePhotoEnabled = !viewModel.isLivePhotoEnabled
        configureLivePhotoButton()
    }
    
    private func configureFlashButton() {
        let systemName = viewModel.isFlashEnabled ? "lightbulb" : "lightbult.slash"
        flashButton.setImage(UIImage(systemName: systemName), for: .normal)
    }
    
    private func configureLivePhotoButton() {
        let systemName = viewModel.isLivePhotoEnabled ? "livephoto" : "livephoto.slash"
        livePhotoButton.setImage(UIImage(systemName: systemName), for: .normal)
    }
}

