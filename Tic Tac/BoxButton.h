//
//  BoxButton.h
//  Tic Tac
//
//  Created by Vaisakh Prakash on 21/01/13.
//  Copyright (c) 2013 QBAdmin . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface BoxButton : UIButton
@property (nonatomic) BoxStatus boxStatus;
@property (nonatomic) BOOL isXmark;
@end
