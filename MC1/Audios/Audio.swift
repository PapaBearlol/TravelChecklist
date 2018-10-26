//
//  Audio.swift
//  MC1
//
//  Created by Antoni Santoso on 24/10/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import Foundation
import AVFoundation

struct Audio {
    static var sfx = AVAudioPlayer()
}

class AudioPlay{
    
    func audioPlay(){
        do{
            Audio.sfx = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "OkButton", ofType: "wav")!))
            Audio.sfx.prepareToPlay()
        } catch{
            print("a")
        }
    }
}
