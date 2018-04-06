//
//  RootViewController.m
//  OPGLDemo
//
//  Created by yollet on 2018/4/3.
//  Copyright © 2018年 yollet. All rights reserved.
//

#import "RootViewController.h"
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import "UIView+LayerSet.h"

@interface RootViewController ()

@property (nonatomic, strong) EAGLContext *eaglContext;
@property (nonatomic, strong) CAEAGLLayer *caeLayer;
@property (nonatomic, assign) GLuint colorBufferRender;
@property (nonatomic, assign) GLuint frameBuffer;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
//    [self useOpgl];
    [self addImage];
}

#pragma mark -- 加载图 --
- (void)addImage
{
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    image.image = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"sss.png"]];
    [self.view addSubview:image];
}

#pragma mark -- 图形处理 --
- (void)useOpgl
{
    // 初始化context对象
    self.eaglContext = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:_eaglContext];
    
    // 设置layer
    self.caeLayer = (CAEAGLLayer *)self.view.layer;
    self.caeLayer.frame = self.view.frame;
    self.caeLayer.opaque = YES;
    self.caeLayer.drawableProperties = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], kEAGLDrawablePropertyRetainedBacking, kEAGLColorFormatRGBA8, kEAGLDrawablePropertyColorFormat, nil];
    
    // 初始化renderBuffer和FrameBuffer
    glGenRenderbuffers(1, &_colorBufferRender);
    glBindRenderbuffer(GL_RENDERBUFFER, _colorBufferRender);
    [self.eaglContext renderbufferStorage:GL_RENDERBUFFER fromDrawable:_caeLayer];
    glGenFramebuffers(1, &_frameBuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, _frameBuffer);
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, _colorBufferRender);
    
    glClearColor(0.5f, 0.5f, 0.5f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT);
    [self.eaglContext presentRenderbuffer:GL_RENDERBUFFER];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
