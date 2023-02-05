//  
//  MovieTrailerView.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 05/02/2023.
//

import UIKit
import youtube_ios_player_helper

class MovieTrailerView: UIView {
    
    let XIB_NAME = "MovieTrailerView"
    
    // MARK: - outlets -
    @IBOutlet weak var videoView: YTPlayerView!
    
    
    // MARK: - Init -
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: - Design -
    
    private func commonInit() {
        guard let xib = Bundle.main.loadNibNamed(XIB_NAME, owner: self, options: nil)?.first, let viewFromXib = xib as? UIView else { return }
        viewFromXib.frame = bounds
        addSubview(viewFromXib)
    }
    
    func configure(videoId: String){
        videoView.load(withVideoId: videoId)
    }
}
