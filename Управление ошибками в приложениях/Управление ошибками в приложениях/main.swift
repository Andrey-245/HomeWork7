//
//  main.swift
//  Управление ошибками в приложениях
//
//  Created by Андрей  on 07.07.2021.
//

import Foundation


//Первая часть
enum musicDownload: Error {
    case moreSizeDownload
    case serverError(error: Int)
    case noNameFiles
    
    
}


struct File {
    var title: String
    var size: Int
}



class downloadMusic {
    var fileDownload = [
        "We_Will_Rock_You.mp3": File(title: "We_Will_Rock_You", size: 8),
        "Blue_Suede_Shoes.mod": File(title: "Blue_Suede_Shoes", size: 7),
        "Still_Loving_You.mp3": File(title: "Still_Loving_You", size: 5)
    ]
    
    var sizeDownload = 12
    var errorValue = 0
    
    func downloadItem(itemNamed name: String, error: Int) throws {
        guard let file = fileDownload[name]
        else {
            throw musicDownload.noNameFiles
        }
        
        guard file.size < sizeDownload
        else {
            throw musicDownload.moreSizeDownload
            
            
        }
      guard error == 300
        else {
        throw musicDownload.serverError(error: errorValue)
        
        }
        
        print("Загружена музыка \(name) размером \(file.size)")
        
    }
    
}

//Вторая часть

let Collection = [
    "TableViem": "We_Will_Rock_You.mp3",
    "TabBar": "Blue_Suede_Shoes.mod",
    "CollectionViem": "Still_Loving_You"

]

func download(Element: String, funcdownload: downloadMusic) throws {
    let serverSMS = 300
    let collectionViem =  Collection[Element] ?? "LoadAudio"
    try funcdownload.downloadItem(itemNamed: "TableViem", error: serverSMS)
}

do {
    try download(Element: "TableViem", funcdownload: downloadMusic())
    
}catch musicDownload.moreSizeDownload {
    print("Very big audio file")
    
}catch musicDownload.noNameFiles {
    print("No audio file")
    
}catch musicDownload.serverError(let errorCodeFile) {
    print("Error")
    
}
