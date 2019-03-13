//
//  camera.m
//  metalDemo0313-1
//
//  Created by MacBook on 2019/3/13.
//  Copyright © 2019 WH2007. All rights reserved.
//

#import "camera.h"
#include <simd/simd.h>

@interface Camera()
{
    float fieldOfView;
    float nearZ;
    float farZ;
}
@end

@implementation Camera

-(instancetype)init {
    if (self = [super init]) {
        fieldOfView = 65.0;
        nearZ = 0.1;
        farZ = 100.0;
    }
    return self;
}

//-(simd_float4x4)projectionMatrix:(float)aspectRatio{
////    return
//}

@end
