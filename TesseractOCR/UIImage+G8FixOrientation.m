//
//  UIImage+G8FixOrientation.m
//  Tesseract OCR iOS
//
//  Thanks to `binnyb` for answer from
//  http://stackoverflow.com/questions/5427656/ios-uiimagepickercontroller-result-image-orientation-after-upload
//
//  Created by Nikolay Volosatov on 09/01/15.
//  Copyright (c) 2014 Daniele Galiotto - www.g8production.com.
//  All rights reserved.
//

#import "UIImage+G8FixOrientation.h"

@implementation UIImage (G8FixOrientation)

- (UIImage *)fixOrientation
{
    // No-op if the orientation is already correct
    if (self.imageOrientation == UIImageOrientationUp) return self;

    UIImage *result;

    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);

    [self drawInRect:(CGRect){0, 0, self.size}];
    result = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return result;
}

@end
