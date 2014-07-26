//
//  SelectStartView.m
//  Tic Tac
//
//  Created by Vaisakh Prakash on 18/01/13.
//  Copyright (c) 2013 QBAdmin . All rights reserved.
//

#import "SelectStartView.h"

@implementation SelectStartView

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"SelectStartView"
                                              owner:self options:nil] objectAtIndex:0];    }
    return self;
}

- (IBAction)selectionButtonAction:(id)sender {
    
    UIButton * selectedButton = sender;
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(selectionButtonPressedWithBoxStatus:)]) {
            
            if (1 == selectedButton.tag) {
                [self.delegate selectionButtonPressedWithBoxStatus:isXmark];
            }else{
                [self.delegate selectionButtonPressedWithBoxStatus:isCircle];
            }
        }
    }
}
- (IBAction)homeButtonAction:(id)sender {
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(goBackToHomePage)]) {
            [self.delegate goBackToHomePage];
        }
    }
}
@end
