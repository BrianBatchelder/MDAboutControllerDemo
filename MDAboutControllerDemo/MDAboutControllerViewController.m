//
//  MDAboutControllerViewController.m
//  MDAboutController
//
//  Created by Dimitri Bouniol on 4/18/11.
//  Copyright 2011 Mochi Development Inc. All rights reserved.
//

#import "MDAboutControllerViewController.h"
#import "MDAboutController.h"

@implementation MDAboutControllerViewController

- (void)dealloc
{
    [aboutController release];
    [navAboutController release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Check if the about controller is being shown
    if (aboutController.parentViewController == nil) {
        // Release and set to nil, so we can recreate it if we need to
        [aboutController release];
        aboutController = nil;
    }
    
    // Check if the about controller is being shown
    if (navAboutController.parentViewController == nil) {
        // Release and set to nil, so we can recreate it if we need to
        [navAboutController release];
        navAboutController = nil;
    }
}

- (IBAction)showAbout:(id)sender
{
    // If the view controller doesn't already exist, create it
    if (!aboutController) {
        aboutController = [[MDAboutController alloc] init];
    }
    
    // Present to user!
    [self presentModalViewController:aboutController animated:YES];
}

- (IBAction)showNavAbout:(id)sender
{
    
    // If the view controller doesn't already exist, create it
    if (!navAboutController) {
        navAboutController = [[UINavigationController alloc] init];
        
        navAboutController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        navAboutController.modalPresentationStyle = UIModalPresentationFormSheet;
        
        MDAboutController *aboutCont = [[MDAboutController alloc] init];
        
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(hideAbout:)];
        aboutCont.navigationItem.rightBarButtonItem = doneButton;
        [doneButton release];
        
        [navAboutController pushViewController:aboutCont animated:NO];
        [aboutCont release];
    }
    
    // Present to user!
    [self presentModalViewController:navAboutController animated:YES];
}
         
- (IBAction)hideAbout:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - View lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
