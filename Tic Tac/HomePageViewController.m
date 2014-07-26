//
//  HomePageViewController.m
//  Tic Tac
//
//  Created by QBAdmin  on 06/12/12.
//  Copyright (c) 2012 QBAdmin . All rights reserved.
//

#import "HomePageViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    //[self playButtonAction:nil];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playButtonAction:(id)sender {
    
    GamePageViewController *gamePageView = [[GamePageViewController alloc]initWithNibName:@"GamePageViewController" bundle:nil];
    [self.navigationController pushViewController:gamePageView animated:YES];
    
}
@end
