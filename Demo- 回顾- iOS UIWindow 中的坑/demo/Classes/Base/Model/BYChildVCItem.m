//
//  BYChildVCItem.m
//  BaisiBudejie
//
//  Created by Baleen.Y on 12/4/16.
//  Copyright © 2016 Baleen.Y. All rights reserved.
//

#import "BYChildVCItem.h"

@implementation BYChildVCItem

#pragma mark -
#pragma mark getChildVCArr
+ (NSArray *)getChildVCArr {
    
    // 字典数组转模型数组
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ChildVC.plist" ofType:nil];
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *temp = [NSMutableArray array];
    for (NSDictionary *dict in arr) {
        BYChildVCItem *childVC = [[BYChildVCItem alloc] init];
        [childVC setValuesForKeysWithDictionary:dict];
        [temp addObject:childVC];
    }
    return temp;
    
}




@end
