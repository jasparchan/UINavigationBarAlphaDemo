//
//  UINavigationBar+RBAlpha.h
//  UINavigationBarAlphaDemo
//
//  Created by fangdr on 2017/2/20.
//
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (RBAlpha)
- (void)rb_setNavigationBarBackgroundColor:(UIColor *)backgroundColor;
- (void)rb_setNavigationBarAlpha:(CGFloat)alpha;
- (void)rb_reset;
@end
