//
//  ASDepthModalViewController.h
//  ASDepthModal
//


#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, ASDepthModalOptions) {
    ASDepthModalOptionAnimationGrow     = 0 << 0, //default
    ASDepthModalOptionAnimationShrink   = 1 << 0,
    ASDepthModalOptionAnimationNone     = 2 << 0,
    ASDepthModalOptionBlur              = 0 << 8, // default
    ASDepthModalOptionBlurNone          = 1 << 8,
    ASDepthModalOptionTapOutsideToClose = 0 << 9, // default
    ASDepthModalOptionTapOutsideInactive= 1 << 9
};

/*
Mostly inspired by http://lab.hakim.se/avgrund/
*/
@interface ASDepthModalViewController : UIViewController <UIGestureRecognizerDelegate>

+ (void)presentView:(UIView *)view backgroundColor:(UIColor *)color options:(ASDepthModalOptions)options completionHandler:(void(^)())handler;
+ (void)presentView:(UIView *)view;
+ (void)dismiss;

@end
