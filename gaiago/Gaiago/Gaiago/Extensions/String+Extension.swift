//
//  UIString+Extension.swift
//  Gaiago
//
//  Created by Vincenzo Broscritto on 10/10/2020.
//

import UIKit

private let imageCache = NSCache<AnyObject, AnyObject>()

extension String {
    
    internal func imageFromServerURL(urlString: String, defaultImage: String?) -> UIImage? {
        var image: UIImage?
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            image = cachedImage
            return image
        }
        
        if let defaultImage = defaultImage {
            image = UIImage(named: defaultImage)
        }
        
        if let imageUrl = NSURL(string: urlString) {
            URLSession.shared.dataTask(with: imageUrl as URL, completionHandler: { data, _, error -> Void in
                if error != nil {
                    image = nil
                    return
                }
                
                if let data = data {
                    if let imageDownloaded = UIImage(data: data) {
                        imageCache.setObject(imageDownloaded, forKey: urlString as AnyObject)
                        image = imageDownloaded
                    }
                }
            }).resume()
        }
        return image
    }
}
