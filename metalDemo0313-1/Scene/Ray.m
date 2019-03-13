//
//  Ray.m
//  metalDemo0313-1
//
//  Created by MacBook on 2019/3/13.
//  Copyright © 2019 WH2007. All rights reserved.
//

#import "Ray.h"


@interface Ray()
{
    simd_float3 origin;
    simd_float3 direction;
}
@end


@implementation Ray

-(Ray *)transform:(simd_float4x4)transform {
    Ray *resRay = [[Ray alloc] init];
    
//    simd_float4 originT = transform * simd_make_float4(origin,1).xyz;
//    simd_float4 directionT = transform
    return resRay;
}

-(instancetype)initWhti:(simd_float3)oritinT
                    and:(simd_float3)directionT
{
    if (self = [super init]) {
        origin = oritinT;
        direction = directionT;
    }
    return self;
}


-(simd_float4 )extrapolate:(float)parameter {
    return simd_make_float4(origin + parameter*direction,1);
}

-(float)interpolate:(simd_float4)point {
    return simd_length(point.xyz - origin)/ simd_length(direction);
}

-(simd_float3)getOrigin {
    return origin;
}

-(simd_float3)getDirection {
    return direction;
}
@end
