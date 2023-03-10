//
//  AsyncImageLodable.swift
//
//  Created by Prashan Samarathunge on 2023-03-10.
//

import Foundation
import SDWebImage

protocol AsyncImageLoadable{
    typealias AsyncImageCompletion = (_ id:Int,_ url:URL?,_ finished:Bool) -> Void
    var loadableImageViews:[UIImageView]{get}
    func loadImage(urls:[URL?],
                   duration:Double,
                   delay:Double,
                   animated:Bool,
                   options:UIView.AnimationOptions,
                   completion: @escaping AsyncImageCompletion)
}

extension AsyncImageLoadable{
    
    func loadImage(urls:[URL?],
                   duration:Double = 0.5,
                   delay:Double = 0,
                   animated:Bool = true,
                   options:UIView.AnimationOptions = [.curveEaseInOut],
                   completion: @escaping AsyncImageCompletion){
        
        if urls.count != loadableImageViews.count {
            fatalError("Items Count is not Equal.")
        }
        
        var mappedImageViews:[(Int,URL?,UIImageView)] = []
        urls.enumerated().forEach{
            mappedImageViews.append(($0.offset, $0.element, loadableImageViews[$0.offset]))
        }
        
        mappedImageViews.forEach { (id:Int, url:URL?, imgView) in
            
            SDWebImageManager.shared.loadImage(with: url, options: [], progress: nil) { image, _, error, _, finished, _ in
                
                if error != nil {
                    
                    let block = { imgView.image = UIImage(named: "icon_banner_placeholder") }
                    
                    if animated{
                        UIView.animate(
                            withDuration: duration,
                            delay: delay,
                            options: options,
                            animations: block,
                            completion:
                                {_ in completion(id, url, finished)}
                        )
                        return
                    }else{
                        block()
                        //Line 83: Fallback Completion
                    }
                    
                }else if let img = image , finished {
                    
                    let block = { imgView.image = img }
                    
                    if animated{
                        UIView.animate(
                            withDuration: duration,
                            delay: delay,
                            options: options,
                            animations: block,
                            completion:
                                {_ in completion(id, url, finished)}
                        )
                        
                    }else{
                        block()
                        //Line 83: Fallback Completion
                    }
                    
                }
                completion(id, url, finished)
                
            }
            
            
        }
        
        
    }
}
