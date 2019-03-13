//
//  BoundingSphere.m
//  metalDemo0313-1
//
//  Created by MacBook on 2019/3/13.
//  Copyright © 2019 WH2007. All rights reserved.
//

#import "BoundingSphere.h"
#import <simd/simd.h>
#import "Ray.h"
@interface BoundingSphere(){
    simd_float3 center;
    simd_float1 radius;
}


@end

@implementation BoundingSphere

-(simd_float4)interect:(Ray *)ray{
    float t0,t1;
    simd_float1 radius2 = radius * radius;
    if (radius2 == 0) {
        
    }
    
    simd_float3 L = center - [ray getOrigin];
    simd_float1 tca = simd_dot(L, [ray getDirection]);
    
    simd_float1 d2 = simd_dot(L, L) - tca * tca;
    if (d2 > radius2) {
        
    }
    
    simd_double1 thc = sqrt(radius2 - d2);
    
    t0 = tca - thc;
    t1 = tca + thc;
    if (t0 > t1) {
        float tem = 0;
        tem = t1;
        t1 = t0;
        t0 = tem;
    }
    if (t0 < 0) {
        t0 = t1;
    }
    return simd_make_float4(ray.getOrigin + [ray getDirection]*t0,1);
}

@end
