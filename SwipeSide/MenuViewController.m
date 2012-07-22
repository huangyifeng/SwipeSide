//
//  MenuViewController.m
//  SwipeSide
//
//  Created by yifeng huang on 12-7-23.
//  Copyright (c) 2012年 huangyifeng. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

-(void)handleRightSwipe:(UISwipeGestureRecognizer *)swipe;
-(void)handleLeftSwipe:(UISwipeGestureRecognizer *)swipe;

@end

@implementation MenuViewController

@synthesize homeController = _homeController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.homeController = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    [self.view addSubview:self.homeController.view];
    _position = Middle;
    
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleRightSwipe:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleLeftSwipe:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.homeController.view addGestureRecognizer:rightSwipe];
    [self.homeController.view addGestureRecognizer:leftSwipe];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)handleRightSwipe:(UISwipeGestureRecognizer *)swipe
{    
    [UIView animateWithDuration:0.2 animations:^{
        if (Middle == _position) {
            self.homeController.view.transform = CGAffineTransformMakeTranslation(150, 0);
            _position = Right;
        }
        else if (Left == _position)
        {
            self.homeController.view.transform = CGAffineTransformIdentity;
            _position = Middle;
        }
    }];
}

-(void)handleLeftSwipe:(UISwipeGestureRecognizer *)swipe
{
    [UIView animateWithDuration:0.2 animations:^{
        if (Middle == _position)
        {
            self.homeController.view.transform = CGAffineTransformMakeTranslation(-150, 0);
            _position = Left;
        }
        else if (Right == _position)
        {
            self.homeController.view.transform = CGAffineTransformIdentity;
            _position = Middle;
        }
    }];
}

@end
