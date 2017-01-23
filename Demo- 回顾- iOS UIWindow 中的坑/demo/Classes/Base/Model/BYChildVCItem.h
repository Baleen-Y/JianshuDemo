//
//  BYChildVCItem.h
//  BaisiBudejie
//
//  Created by Baleen.Y on 12/4/16.
//  Copyright © 2016 Baleen.Y. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYChildVCItem : NSObject

/**类名*/
@property (nonatomic, strong) NSString *className;
/**图片*/
@property (nonatomic, strong) NSString *image;
/**选中时的图片*/
@property (nonatomic, strong) NSString *selImage;
/**标题*/
@property (nonatomic, strong) NSString *title;

/**取得子控制器数组*/
+ (NSArray *)getChildVCArr;

@end
