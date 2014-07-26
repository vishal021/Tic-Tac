//
//  SelectOpponentView.h
//  Tic Tac
//
//  Created by Vaisakh Prakash on 18/01/13.
//  Copyright (c) 2013 QBAdmin . All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectOpponentViewDelegate;

@interface SelectOpponentView : UIView

- (IBAction)selectionButtonAction:(id)sender;
- (IBAction)homeButtonAction:(id)sender;

@property(nonatomic, assign) id<SelectOpponentViewDelegate>delegate;
@end

@protocol SelectOpponentViewDelegate <NSObject>
- (void) goBackToHomePage;
-(void) selectionButtonPressedWithiPhone:(BOOL)isiPhone;
@end