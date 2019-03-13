//
//  HitResult.m
//  metalDemo0313-1
//
//  Created by MacBook on 2019/3/13.
//  Copyright © 2019 WH2007. All rights reserved.
//

#import "HitResult.h"

@interface HitResult()
{
    Node *node;
    Ray *ray;
    float parameter;
    simd_float4 intersectionPoint;
}
@end
@implementation HitResult

-(instancetype)init{
    if (self = [super init]) {
        intersectionPoint = simd_make_float4([ray getOrigin] + [ray getDirection], 1);
    }
    return self;
}

@end
