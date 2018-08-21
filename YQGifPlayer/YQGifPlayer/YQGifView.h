//
//  YQGifView.h
//  YQGifPlayer
//
//  Created by 杨清 on 2018/8/20.
//  Copyright © 2018年 深圳市前海硕极科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>

@interface YQGifView : UIView

- (id)initWithFrame:(CGRect)frame filePath:(NSString *)_filePath;
- (id)initWithFrame:(CGRect)frame data:(NSData *)_data;

/**
 * 设置播放速度
 */
- (void)resumeWithSpeed:(CGFloat)speed;

@end
