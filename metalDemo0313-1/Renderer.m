//
//  Renderer.m
//  metalDemo0313-1
//
//  Created by MacBook on 2019/3/13.
//  Copyright © 2019 WH2007. All rights reserved.
//

#import "Renderer.h"
#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
#import <simd/simd.h>
#import "Scene/Scene.h"
#import "Scene/Node.h"
#import "Scene/Camera.h"

typedef struct {
    simd_float4x4 modelViewProjectionMatrix;
    simd_float4x4 normalMatirx;
    simd_float4x4 color;
}InstanceConstants;

int MaxInFlightFrameCount = 3;
int ConstantBufferLength = 65; // Adjust this if you need to draw more objects
int ConstantAlignment = 256; //

@interface Renderer()
{
    MTKView *mView;
    id <MTLDevice> mDevice;
    id <MTLRenderPipelineState> renderPipelineState;
    id <MTLDepthStencilState> depthStencilState;
    id <MTLBuffer> constantBuffers;
    NSUInteger frameIndex;
}
@end

@implementation Renderer

-(id)initWith:(MTKView *)view
          and:(MDLVertexDescriptor *)vertexDescriptor
{
    if (self = [super init]) {
        mDevice = view.device;
        mView = view;
        
        
    }
    return self;
}

-(id <MTLDepthStencilState>)makeDepthStencilState:(id<MTLDevice>)device {
    
    MTLDepthStencilDescriptor *depthDes = [MTLDepthStencilDescriptor new];
    depthDes.depthCompareFunction = MTLCompareFunctionLess;
    [depthDes setDepthWriteEnabled:YES];
    
    return [device newDepthStencilStateWithDescriptor:depthDes];
}

-(id <MTLRenderPipelineState>)makeRenderPipelineState:(MTKView *)view
                           and:(MDLVertexDescriptor *)vertexDescriptor{
    id <MTLLibrary> library = [view.device newDefaultLibrary];
    id <MTLFunction> verfunc = [library newFunctionWithName:@"verfunc"];
    id <MTLFunction> fragfunc = [library newFunctionWithName:@"fragfunc"];
    MTLVertexDescriptor *mtlVertexDescriptor =  MTKMetalVertexDescriptorFromModelIO(vertexDescriptor);
    MTLRenderPipelineDescriptor *renderDes = [MTLRenderPipelineDescriptor new];
    renderDes.vertexFunction = verfunc;
    renderDes.fragmentFunction = fragfunc;
    renderDes.vertexDescriptor = mtlVertexDescriptor;
    renderDes.sampleCount = view.sampleCount;
    renderDes.colorAttachments[0].pixelFormat = view.colorPixelFormat;
    renderDes.depthAttachmentPixelFormat = view.depthStencilPixelFormat;
    
    return [view.device newRenderPipelineStateWithDescriptor:renderDes error:nil];
    
}

-(void)draw:(Scene *)scene
        and:(Node *)pointOfView
        and:(id <MTLRenderCommandEncoder>)renderCommandEncoder{
    Node *cameraNode = pointOfView;
    Camera *camera = [cameraNode getCamera];
    frameIndex = (frameIndex + 1) % MaxInFlightFrameCount;
    
    
    [renderCommandEncoder setRenderPipelineState:renderPipelineState];
    [renderCommandEncoder setDepthStencilState:depthStencilState];
    
    // ☆ 要修改为逆矩阵
    simd_float4x4 viewmatrix = [cameraNode getWordTransform];
    
    CGRect viewpoint = mView.bounds;
    float width = CGRectGetWidth(viewpoint);
    float height = CGRectGetHeight(viewpoint);
    float aspectRatio = width/height;
    
    
}









@end
