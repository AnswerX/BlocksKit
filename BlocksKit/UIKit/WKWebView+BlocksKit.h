//
//  WKWebView+BlocksKit.h
//  BlocksKit
//
//  Created by Reed Xu on 2020/6/16.
//  Copyright © 2020 Zachary Waldowski and Pandamonia LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface WKWebView (BlocksKit)
/** The block to be decide whether a URL will be loaded.
 
 @warning If the delegate implements webView:shouldStartLoadWithRequest:navigationType:,
 the return values of both the delegate method and the block will be considered.
*/
//@property (nonatomic, copy, setter = bk_setShouldStartLoadBlock:) BOOL (^bk_shouldStartLoadBlock)(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType);

/** The block that is fired when the web view starts loading. */
//@property (nonatomic, copy, setter = bk_setDidStartLoadBlock:) void (^bk_didStartLoadBlock)(UIWebView *webView);

/** The block that is fired when the web view finishes loading. */
//@property (nonatomic, copy, setter = bk_setDidFinishLoadBlock:) void (^bk_didFinishLoadBlock)(UIWebView *webView);

/** The block that is fired when the web view stops loading due to an error. */
//@property (nonatomic, copy, setter = bk_setDidFinishWithErrorBlock:) void (^bk_didFinishWithErrorBlock)(UIWebView *webView, NSError *error);

@property (nonatomic, copy, setter = bk_setDecidePolicyForNavigationActionBlock:) BOOL (^bk_decidePolicyForNavigationActionBlock)(WKWebView *webView, WKNavigationAction *navigationAction, WKNavigationActionPolicy decisionHandler);

@property (nonatomic, copy, setter = bk_setDidCommitNavigationBlock:) void (^bk_didCommitNavigationBlock)(WKWebView *webView);

@property (nonatomic, copy, setter = bk_setDidFinishNavigationBlock:) void (^bk_didFinishNavigationBlock)(WKWebView *webView);
@property (nonatomic, copy, setter = bk_setDidFailNavigationBlock:) void (^bk_didFailNavigationBlock)(WKWebView *webView);

@end

NS_ASSUME_NONNULL_END
