//
//  SideBarViewController.h
//  Creanara
//
//  Created by promatics on 7/26/14.
//  Copyright (c) 2014 GameDeals. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideBarViewController : UIViewController <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIViewController *rearViewController;
@property (nonatomic, strong) UIViewController *frontViewController;
@property (weak, nonatomic) IBOutlet UIView *rearView;
@property (weak, nonatomic) IBOutlet UIView *frontView;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGestureOfSlide;

- (IBAction)handlePan:(UIPanGestureRecognizer *)sender;

-(void)toggleSlideMenu;
//-(void)unrevealSlideMenu;


@end

@interface UIViewController (SlideMenu)

@property (readonly,nonatomic,getter=slideViewController) UIViewController *slideViewController;



@end
