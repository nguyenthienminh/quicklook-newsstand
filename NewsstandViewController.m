//
//  NewsstandViewController.m
//  MagPi Newsstand App
//
//  Created by Nguyen Thien Minh on 10/30/22.
//  Copyright (c) 2022 Nguyen Thien Minh. All rights reserved.
//

#import "NewsstandViewController.h"
#import <QuickLook/QuickLook.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface NewsstandViewController : UIViewController <QLPreviewControllerDataSource>
@end

@implementation NewsstandViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)viewDidAppear:(BOOL)animated {
    QLPreviewController *controller = [[QLPreviewController alloc] init];
    controller.dataSource = self;
    [self presentViewController:controller animated:YES completion:^{
    }];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - QLPreviewControllerDataSource

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller
{
    return 1;
}

- (id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index
{
    return [[NSBundle mainBundle] URLForResource:@"article" withExtension:@"pdf"];
}
@end
