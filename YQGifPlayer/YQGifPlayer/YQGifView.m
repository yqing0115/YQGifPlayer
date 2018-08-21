//
//  YQGifView.m
//  YQGifPlayer
//
//  Created by 杨清 on 2018/8/20.
//  Copyright © 2018年 Soargift. All rights reserved.
//

#import "YQGifView.h"
#import <QuartzCore/QuartzCore.h>



@interface YQGifView ()

@property (assign,nonatomic) CGImageSourceRef gif;
@property (copy,nonatomic) NSDictionary *gifProperties;
@property (assign,nonatomic) size_t index;
@property (assign,nonatomic) size_t count;
@property (strong,nonatomic) NSTimer *timer;

@end

@implementation YQGifView

- (id)initWithFrame:(CGRect)frame filePath:(NSString *)filePath{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.gifProperties = @{
                                (NSString *)kCGImagePropertyGIFDictionary : @{@0:(NSString *)kCGImagePropertyGIFLoopCount}
                                };
        self.gif = CGImageSourceCreateWithURL((CFURLRef)[NSURL fileURLWithPath:filePath], (CFDictionaryRef)self.gifProperties);
        self.count =CGImageSourceGetCount(self.gif);
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.12 target:self selector:@selector(play) userInfo:nil repeats:YES];
        [self.timer fire];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame data:(NSData *)data{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.gifProperties = @{
                               (NSString *)kCGImagePropertyGIFDictionary : @{@0:(NSString *)kCGImagePropertyGIFLoopCount}
                               };
        self.gif = CGImageSourceCreateWithData((CFDataRef)data, (CFDictionaryRef)self.gifProperties);
        self.count =CGImageSourceGetCount(self.gif);
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.12 target:self selector:@selector(play) userInfo:nil repeats:YES];
        [self.timer fire];
    }
    return self;
}
//设置播放速度
- (void)resumeWithSpeed:(CGFloat)speed
{
    if (speed <= 0.0) {
        return;
    }
    [_timer invalidate];
    _timer = nil;
    __weak __typeof(self)weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        weakSelf.timer = [NSTimer scheduledTimerWithTimeInterval:0.12*(1.0/speed) target:weakSelf selector:@selector(play) userInfo:nil repeats:YES];
        [weakSelf.timer fire];
    });
}

-(void)play
{
    _index ++;
    _index = _index%_count;
    CGImageRef ref = CGImageSourceCreateImageAtIndex(self.gif, self.index, (CFDictionaryRef)self.gifProperties);
    self.layer.contents = (__bridge id _Nullable)(ref);
    CFRelease(ref);
}
-(void)removeFromSuperview
{
    NSLog(@"removeFromSuperview");
    [_timer invalidate];
    _timer = nil;
    [super removeFromSuperview];
}
- (void)dealloc {
    NSLog(@"dealloc");
    CFRelease(_gif);
}
@end
