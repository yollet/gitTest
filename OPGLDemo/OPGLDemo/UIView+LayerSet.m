//
//  UIView+LayerSet.m
//  OPGLDemo
//
//  Created by yollet on 2018/4/3.
//  Copyright © 2018年 yollet. All rights reserved.
//

#import "UIView+LayerSet.h"

@implementation UIView (LayerSet)

+ (Class)layerClass
{
    return [CAEAGLLayer class];
}

@end
