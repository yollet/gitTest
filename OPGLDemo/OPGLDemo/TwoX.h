//
//  TwoX.h
//  OPGLDemo
//
//  Created by yollet on 2018/4/3.
//  Copyright © 2018年 yollet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TwoX : NSObject

@property (nonatomic, strong) TwoX *left;
@property (nonatomic, strong) TwoX *right;
@property (nonatomic, assign) NSInteger data;

@end
