//
//  SideBarViewController.m
//  Creanara
//
//  Created by promatics on 7/26/14.
//  Copyright (c) 2014 GameDeals. All rights reserved.
//

#import "SideBarViewController.h"


//#define WidthForSideBar 260
//#define threshHoldValueForSideBar 150

@interface SideBarViewController ()
{
    BOOL start;
    BOOL isOpen;
    
    float WidthForSideBar, threshHoldValueForSideBar;
}

//@property (copy, nonatomic) UIViewController *rearViewController;
//@property (copy, nonatomic) UIViewController *frontViewController;
@end

@implementation SideBarViewController

@synthesize frontView,rearView,rearViewController,frontViewController,panGestureOfSlide;

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
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    isOpen = false;
    
    frontView.layer.shadowColor = [UIColor blackColor].CGColor;
    frontView.layer.shadowOpacity = 1.0;
    
    UIStoryboard *storyboard = self.storyboard;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        storyboard = [UIStoryboard storyboardWithName:@"Main_IPad" bundle:nil];
        
        WidthForSideBar = 650.0f;
        threshHoldValueForSideBar = 384.0f;
        
    } else {
        
        storyboard = [UIStoryboard storyboardWithName:@"Main_IPhone" bundle:nil];
        
        WidthForSideBar = 260.0f;
        threshHoldValueForSideBar = 150.0f;
    }
    
    //[frontView removeGestureRecognizer:panGestureOfSlide];
    
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"appear");
    // [rearViewController willMoveToParentViewController:nil];
    // [rearViewController.view removeFromSuperview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"segue");
    if ([[segue identifier] isEqualToString:@"front"]) {
        frontViewController = segue.destinationViewController;
        
      //  NSLog(@"%@",frontViewController);
    }
    else if([[segue identifier] isEqualToString:@"Rear"]) {
        rearViewController = segue.destinationViewController;
    }
}

-(void)toggleSlideMenu{
    
    
    [UIView beginAnimations:@"slide" context:nil];
    [UIView setAnimationDuration:0.5];
    
    if (isOpen) {
        isOpen = false;
        frontView.frame = CGRectMake(0, 0, frontView.frame.size.width, frontView.frame.size.height);
    } else {
        isOpen = true;
        frontView.frame = CGRectMake(-WidthForSideBar, 0, frontView.frame.size.width, frontView.frame.size.height);
    }
    
    [UIView commitAnimations];
}

-(void)retoggleSlideMenu{
    
    
    [UIView beginAnimations:@"slide" context:nil];
    [UIView setAnimationDuration:0.5];
    
    if (!isOpen) {
        frontView.frame = CGRectMake(0, 0, frontView.frame.size.width, frontView.frame.size.height);
    } else {
        frontView.frame = CGRectMake(-WidthForSideBar, 0, frontView.frame.size.width, frontView.frame.size.height);
    }
    
    
    
    [UIView commitAnimations];
}

- (IBAction)handlePan:(UIPanGestureRecognizer *)sender {
    
    CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:frontView];
    CGPoint locatedPoint = [(UIPanGestureRecognizer*)sender locationInView:frontView];
    NSLog(@"x %f y %f",translatedPoint.x,translatedPoint.y);
    if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        NSLog(@"began");
        
        NSLog(@"fr x %f y %f",locatedPoint.x,locatedPoint.y);
        
        //if (locatedPoint.x > frontView.frame.size.width-50) {
        start = TRUE;
        //        } else{
        //            start = false;
        //        }
        
        
    }
    
    if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStatePossible) {
        NSLog(@"possible");
        
        NSLog(@"fr x %f y %f",locatedPoint.x,locatedPoint.y);
        
        //if (locatedPoint.x > frontView.frame.size.width-50) {
        //start = TRUE;
        //        } else{
        //            start = false;
        //        }
        
        
    }
    
    if (start) {
        if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
            NSLog(@"end");
            
            if (translatedPoint.x >= threshHoldValueForSideBar || translatedPoint.x <= -threshHoldValueForSideBar) {
                [self toggleSlideMenu];
            } else{
                [self retoggleSlideMenu];
            }
        } else if([(UIPanGestureRecognizer*)sender state] != UIGestureRecognizerStateBegan){
            if (translatedPoint.x <= WidthForSideBar || translatedPoint.x >= -WidthForSideBar) {
                int x = translatedPoint.x<0 ? translatedPoint.x : translatedPoint.x-WidthForSideBar;
                
                if (isOpen) {
                    x =  x > WidthForSideBar ? WidthForSideBar : x;
                } else{
                    x =  x < -WidthForSideBar ? -WidthForSideBar : x;
                }
                
                NSLog(@"x value %d",x);
                frontView.frame = CGRectMake(x, 0, frontView.frame.size.width, frontView.frame.size.height);
            }
        }
    }
    
}



#pragma mark uigesturerecognizer delegate

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
//    return YES;
//}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    CGPoint translatedPoint = [(UIPanGestureRecognizer*)gestureRecognizer translationInView:frontView];
    NSLog(@"should begin x %f y %f",translatedPoint.x,translatedPoint.y);
    
    if (isOpen && translatedPoint.x > 0) {
        return TRUE;
    } else if(!isOpen && translatedPoint.x < 0){
        return TRUE;
    }
    
    return FALSE;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    
    NSLog(@"gestures %@ %@",gestureRecognizer,otherGestureRecognizer);
    
    return TRUE;
}


//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
//    CGPoint locatedPoint = [(UIPanGestureRecognizer*)gestureRecognizer locationInView:frontView];
//    if (locatedPoint.x > frontView.frame.size.width-10) {
//        return TRUE;
//    } else{
//        return false;
//    }
//}


//
//-(void)unrevealSlideMenu{
//    [UIView beginAnimations:@"slide" context:nil];
//    [UIView setAnimationDuration:0.5];
//
//    frontView.frame = CGRectMake(0, 0, frontView.frame.size.width, frontView.frame.size.height);
//
//   [UIView commitAnimations];
//}




/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end


@implementation UIViewController (SlideMenu)

-(id)slideViewController
{
    UIViewController *vc = self;
    
    while ( nil != (vc = [vc parentViewController]) && ![vc isKindOfClass:[SideBarViewController class]]) {
        
    }
    
    return (id)vc;
}

@end

