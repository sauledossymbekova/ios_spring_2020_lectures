//
//  ImageService.swift
//  Images
//
//  Created by erumaru on 4/11/20.
//  Copyright © 2020 kbtu. All rights reserved.
//

import Foundation
import Cloudinary

class ImageService {
    static let shared = ImageService()
    let config = CLDConfiguration(cloudName: "abzal", apiKey: "342516434849179")
    lazy var client = CLDCloudinary(configuration: config)

    func upload(image: UIImage?, completion: @escaping (String?) -> Void)  {
        guard let data = image?.pngData() else { return }
        
        client.createUploader().upload(data: data, uploadPreset: "abzal123") { result, error in
            DispatchQueue.main.async {
                completion(result?.url)
            }
        }
    }
    
    func download(url: String, completion: @escaping (UIImage?) -> Void) {
        client.createDownloader().fetchImage(url) { result, error in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
