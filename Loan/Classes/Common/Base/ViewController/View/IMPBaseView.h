//
//  IMPBaseView.h
//  Loan
//
//  Created by 王胜华 on 17/10/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Masonry.h"
#import "Colours.h"

#import "IMPBaseLabel.h"
#import "IMPBaseTextField.h"
#import "IMPBaseButton.h"

@protocol IMPViewProtocol

@required
- (void)initSubviews;

- (void)bindCommands;

@optional
//TODO: optional methods

@end

@interface IMPBaseView : UIView <IMPViewProtocol>

@end
