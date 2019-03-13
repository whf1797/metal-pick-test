//
//  Node.h
//  metalDemo0313-1
//
//  Created by MacBook on 2019/3/13.
//  Copyright © 2019 WH2007. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Camera.h"
#import <simd/simd.h>
NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject


-(void)removeChildNode:(Node *)node;
-(Camera *)getCamera;
-(simd_float4x4)getWordTransform;
@end

NS_ASSUME_NONNULL_END
