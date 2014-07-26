//
//  GameCompletedView.m
//  Tic Tac
//
//  Created by Vaisakh Prakash on 18/01/13.
//  Copyright (c) 2013 QBAdmin . All rights reserved.
//

#import "GameCompletedView.h"

@implementation GameCompletedView
@synthesize gameCompletedImageView;
@synthesize gameCompletedLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"GameCompletedView"
                                              owner:self options:nil] objectAtIndex:0];
        
    }
    return self;
}

- (IBAction)homeButtonAction:(id)sender {
    
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(goBackToHomePage)]) {
            [self.delegate goBackToHomePage];
        }
    }
}
- (IBAction)replayButtonAction:(id)sender {
    
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(replayGame)]) {
            [self.delegate replayGame];
        }
    }
}

- (void)dealloc {
    [GameCompletedView release];
    [GameCompletedView release];
    [super dealloc];
}
@end
