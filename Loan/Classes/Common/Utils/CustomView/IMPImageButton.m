//
//  IMPImageButton.m
//  Loan
//
//  Created by 王胜华 on 23/11/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#import "IMPImageButton.h"

@implementation IMPImageButton

+ (instancetype)buttonWithImageName:(NSString *)imageName
{
    IMPImageButton *imageButton = [[IMPImageButton alloc] initWithImageName:imageName];
    
    return imageButton;
}

- (instancetype)initWithImageName:(NSString *)imageName
{
    self = [super init];
    
    if (self) {
        [self setBackgroundImage:IMAGE_NAME(imageName) forState:UIControlStateNormal];
        [self setBackgroundImage:IMAGE_NAME(imageName) forState:UIControlStateHighlighted];
    }
    
    return self;
}

@end
