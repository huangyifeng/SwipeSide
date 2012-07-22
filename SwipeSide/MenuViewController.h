//
//  MenuViewController.h
//  SwipeSide
//
//  Created by yifeng huang on 12-7-23.
//  Copyright (c) 2012年 huangyifeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"

typedef enum 
{
    Left = 0,
    Middle = 1,
    Right = 2
}Position;

@interface MenuViewController : UIViewController
{
    HomeViewController  *_homeController;
    Position            _position;
}

@property(nonatomic, strong) IBOutlet HomeViewController    *homeController;

@end
