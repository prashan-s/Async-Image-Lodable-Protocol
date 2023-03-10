# Async Image Loadable Protocol  
  

*The AsyncImageLoadable protocol is a Swift protocol that provides the ability to load images asynchronously into a collection of UIImageViews, with customizable animation and timing options. The protocol also includes a completion handler that can be used to track the progress of the image loading.*  
  



### Features  
- ❓Asynchronously loads images into a collection of UIImageViews for improved performance
  
  

- ⚡ Supports customizable animation options, including duration, delay, and animation type  
  

- 💫 Provides a completion handler to track the progress of the image loading  
  

- Easy to integrate into any Swift application  
  



### Usage  
To use the AsyncImageLoadable protocol in your Swift application, you will need to implement the protocol and provide your own implementation for the loadImage() method. Here is an example implementation:  
  

typealias AsyncImageCompletion = (_ id:Int,_ url:URL?,_ finished:Bool) -> Void

protocol AsyncImageLoadable {
    var loadableImageViews:[UIImageView] {get}
    func loadImage(urls:[URL?],
                   duration:Double,
                   delay:Double,
                   animated:Bool,
                   options:UIView.AnimationOptions,
                   completion: @escaping AsyncImageCompletion)
}

extension AsyncImageLoadable {
    func loadImage(urls:[URL?],
                   duration:Double = 0.5,
                   delay:Double = 0.0,
                   animated:Bool = true,
                   options:UIView.AnimationOptions = .transitionCrossDissolve,
                   completion: @escaping AsyncImageCompletion) {
        // Your implementation here
    }
}  
  

#### In this implementation, the loadImage() method takes an array of URL objects representing the images to be loaded, as well as several optional parameters for customizing the animation behavior. The method also includes a completion handler that will be called after each image is loaded, providing the image's ID, URL, and a flag indicating whether all images have been loaded.

Once you have implemented the AsyncImageLoadable protocol in your application, you can use it to asynchronously load images into a collection of UIImageViews. For example:  
  

class MyViewController: UIViewController, AsyncImageLoadable {
    var loadableImageViews: [UIImageView] = []

    func viewDidLoad() {
        super.viewDidLoad()

        loadableImageViews = [imageView1, imageView2, imageView3]
        let imageUrls = [URL(string: "https://example.com/image1.jpg"), URL(string: "https://example.com/image2.jpg"), URL(string: "https://example.com/image3.jpg")]
        
        loadImage(urls: imageUrls) { id, url, finished in
            // Do something with the loaded image
        }
    }
}  
  



### Installation  
To install the AsyncImageLoadable protocol in your Swift application, simply copy the code from the example implementation into your own codebase.  
  



### License  
This protocol is licensed under the MIT License. See the LICENSE file for more information.  

<br />
