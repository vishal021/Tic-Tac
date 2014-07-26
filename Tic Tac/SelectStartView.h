//
//  SelectStartView.h
//  Tic Tac
//
//  Created by Vaisakh Prakash on 18/01/13.
//  Copyright (c) 2013 QBAdmin . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
@protocol SelectStartViewDelegate;

@interface SelectStartView : UIView

- (IBAction)selectionButtonAction:(id)sender;
- (IBAction)homeButtonAction:(id)sender;

@property(nonatomic, assign) id<SelectStartViewDelegate>delegate;

@end

@protocol SelectStartViewDelegate <NSObject>
- (void) goBackToHomePage;
-(void) selectionButtonPressedWithBoxStatus:(BoxStatus)boxStatus;
@end
