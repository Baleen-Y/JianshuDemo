//
//  BYPublishVC.m
//  demo
//
//  Created by Baleen.Y on 1/23/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

#import "BYPublishVC.h"

@interface BYPublishVC ()

@end

@implementation BYPublishVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)publishClick {
    UIWindow *currentWindow = [UIApplication sharedApplication].windows.lastObject;
//    currentWindow.rootViewController = nil;
//    currentWindow.alpha = 0;
    self.view.alpha = 0;
    currentWindow.hidden = YES;
//    currentWindow.windowLevel = 0;
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"publishClick" object:nil];

}

- (void)dealloc {
    NSLog(@"dealloc");
}
@end
