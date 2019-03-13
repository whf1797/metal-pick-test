//
//  Node.m
//  metalDemo0313-1
//
//  Created by MacBook on 2019/3/13.
//  Copyright © 2019 WH2007. All rights reserved.
//

#import "Node.h"
#import <MetalKit/MetalKit.h>

@interface Meterial : NSObject
{
    simd_float4 color;
    BOOL highlighted;
}
@end

@implementation Meterial

-(instancetype)init {
    if (self = [super init]) {
        color = simd_make_float4(1, 1, 1, 1);
        highlighted = false;
    }
    return self;
}

@end

@interface Node()
{
    __weak Node *parent;
    NSString *identifier;
    NSString *name;
    NSMutableArray <Node *> *children;
    Camera *camera;
    MTKMesh *mesh;
    Meterial *material;
    simd_float4x4 transform;
    simd_float4x4 worldTransform;
}
@end

@implementation Node

-(instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

-(void)addchildNode:(Node *)node {
    if (node->parent != nil) {
        
    }
}

-(void)removeChildNode:(Node *)node
{
    if ([children containsObject:node]) {
        [children removeObject:node];
    }
}

-(void)removeFromParent{
    if (parent) {
        [parent removeChildNode:self];
    }
}

-(Camera *)getCamera{
    return camera;
}

-(simd_float4x4)getWordTransform{
    return worldTransform;
}


@end
