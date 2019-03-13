//
//  Ray.h
//  metalDemo0313-1
//
//  Created by MacBook on 2019/3/13.
//  Copyright © 2019 WH2007. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <simd/simd.h>
NS_ASSUME_NONNULL_BEGIN

@interface Ray : NSObject

-(simd_float3)getOrigin;

-(simd_float3)getDirection;
@end

NS_ASSUME_NONNULL_END
