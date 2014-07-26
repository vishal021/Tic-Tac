//
//  SelectOpponentView.m
//  Tic Tac
//
//  Created by Vaisakh Prakash on 18/01/13.
//  Copyright (c) 2013 QBAdmin . All rights reserved.
//

#import "SelectOpponentView.h"

@implementation SelectOpponentView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"SelectOpponentView"
                                             owner:self options:nil] objectAtIndex:0];
    }
    return self;
}

- (IBAction)selectionButtonAction:(id)sender {
    
    UIButton * selectedButton = sender;
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(selectionButtonPressedWithiPhone:)]) {
            
            if (1 == selectedButton.tag) {
                [self.delegate selectionButtonPressedWithiPhone:NO];
            }else{
                [self.delegate selectionButtonPressedWithiPhone:YES];
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
