//
//  UINavigationBar+RBAlpha.m
//  UINavigationBarAlphaDemo
//
//  Created by fangdr on 2017/2/20.
//
//

#import "UINavigationBar+RBAlpha.h"
#import <objc/runtime.h>
#import <Masonry/Masonry.h>
@implementation UINavigationBar (RBAlpha)

static char overlayKey;
- (UIView *)overlay {
    return objc_getAssociatedObject(self, &overlayKey);
}
- (void)setOverlay:(UIView *)overlay {
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)rb_setNavigationBarBackgroundColor:(UIColor *)backgroundColor {
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.overlay = [[UIView alloc] initWithFrame:CGRectZero];
        self.overlay.userInteractionEnabled = NO;
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [[self.subviews firstObject] insertSubview:self.overlay atIndex:0];
        [self.overlay mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo([self.subviews firstObject]).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
    self.overlay.backgroundColor = backgroundColor;
}


- (void)rb_setNavigationBarAlpha:(CGFloat)alpha {
    [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    UIView *titleView = [self valueForKey:@"_titleView"];
    titleView.alpha = alpha;

    [[self subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:NSClassFromString(@"UINavigationItemView")]) {
            obj.alpha = alpha;
            *stop = YES;
        }
    }];
}
- (void)rb_reset{
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    if (self.overlay.superview) {
        [self.overlay removeFromSuperview];
    }
    self.overlay = nil;
}
@end
