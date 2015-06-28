//
//  ViewController.swift
//  subPhoto
//
//  Created by D_ttang on 15/6/28.
//  Copyright © 2015年 D_ttang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var subImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    var subRect: CGRect!
    var scaleSize: CGSize!
    var useSubRect: CGRect!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let sizeWidth = view.frame.width
        var sizeHeight = view.frame.height
        subRect = CGRectMake(view.center.x - 50, view.center.y - 50, 300, 300)

//        subImageView.layer.cornerRadius = CGRectGetWidth(subImageView.frame) / 2
//        subImageView.layer.masksToBounds = true
        
        
        var imageViewImage = imageView.image
        let imageViewImageSize = imageViewImage?.size
        let imageViewImageSizeWidth = imageViewImageSize?.width
        let imageViewImageSizeHeight = imageViewImageSize?.height
        print("\(imageViewImageSizeWidth)...\(imageViewImageSizeHeight)")
        
        if let imageWidth = imageViewImageSizeWidth, imageHeight = imageViewImageSizeHeight {
            sizeHeight = sizeWidth / imageWidth * imageHeight
        }
        
//        let imageViewFrame = self.imageView.center
//        print("\(imageViewFrame)")
//        print("\(self.view.frame)")
        
//        scaleSize = CGSize(width: sizeWidth, height: sizeHeight)
//        subRect = CGRectMake(0, self.view.center.y - self.imageView.bounds.height / 2, sizeWidth, sizeWidth)
        useSubRect = CGRectMake(0, 50, sizeWidth, sizeWidth)
        
        let subLayer = CALayer()
        subLayer.frame = useSubRect
        subLayer.borderColor = UIColor.blueColor().CGColor
        subLayer.borderWidth = 3.0
        subLayer.cornerRadius = 15.0
        imageView.layer.addSublayer(subLayer)
        
        guard let image = imageViewImage else {
            print("imageViewImage is nil")
            return
        }
        imageViewImage = image.scaleToSize(sizeWidth)
        imageView.image = imageViewImage
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func selectFromLib(sender: UITapGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true , completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectImage = info[UIImagePickerControllerOriginalImage] as! UIImage
//        let scaleImage = scaleFromImage(selectImage, scaleToSize: CGSize(width: self.view.frame.width , height: self.view.frame.height))
        imageView.image = selectImage.scaleToSize(view.frame.width)
        dismissViewControllerAnimated(true , completion: nil)
    }
    
    @IBAction func subImageAction(sender: UIButton) {
        let imageViewImage = imageView.image
        guard let image = imageViewImage else {
            print("imageView image is nil")
            return
        }
        let subImage = image.getSubImage(useSubRect)
        subImageView.image = subImage
    }
    
    func scaleFromImage(image: UIImage, scaleToSize: CGSize) -> UIImage{
        UIGraphicsBeginImageContext(scaleToSize)
        image.drawInRect(CGRectMake(0, 0, scaleToSize.width, scaleToSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
}

extension UIImage{
    func getSubImage(rect: CGRect) -> UIImage{
        
        let subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect)
        let smallBounds:CGRect = CGRectMake(CGFloat(0.0), CGFloat(0.0), CGFloat(CGImageGetWidth(subImageRef)), CGFloat(CGImageGetHeight(subImageRef)))
        
        UIGraphicsBeginImageContext(smallBounds.size)
        let context: CGContextRef  = UIGraphicsGetCurrentContext()
        CGContextDrawImage(context, smallBounds, subImageRef)
        let smallImage:UIImage = UIImage(CGImage: subImageRef)
        UIGraphicsEndImageContext()
        
        return smallImage
    }
    
    func scaleToSize(viewWidth: CGFloat) -> UIImage{
        let sizeWidth = viewWidth
        let sizeHeight = viewWidth / self.size.width * self.size.height
        let size = CGSize(width: sizeWidth, height: sizeHeight)
        print("size: \(size)")
        UIGraphicsBeginImageContext(size)
        self.drawInRect(CGRectMake(0, 0, size.width, size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    
}

