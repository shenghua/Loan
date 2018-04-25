//
//  IMPImageButton.h
//  Loan
//
//  Created by 王胜华 on 23/11/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#import "IMPBaseButton.h"

@interface IMPImageButton : IMPBaseButton

/**
 * 生成图片按钮
 *
 * @param imageName 图片名称
 * @return 按钮对象
 */
+ (instancetype)buttonWithImageName:(NSString *)imageName;

@end
