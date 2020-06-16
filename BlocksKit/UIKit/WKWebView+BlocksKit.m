//
//  WKWebView+BlocksKit.m
//  BlocksKit
//
//  Created by Reed Xu on 2020/6/16.
//  Copyright © 2020 Zachary Waldowski and Pandamonia LLC. All rights reserved.
//
#import "A2DynamicDelegate.h"
#import "NSObject+A2BlockDelegate.h"
#import "WKWebView+BlocksKit.h"

#pragma mark Custom delegate

@interface A2DynamicUIWebViewDelegate : A2DynamicDelegate <WKNavigationDelegate>
@end

@implementation A2DynamicUIWebViewDelegate

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    WKNavigationActionPolicy *policy;
    

    id realDelegate = self.realDelegate;
    
    if (realDelegate && [realDelegate respondsToSelector:@selector(webView:decidePolicyForNavigationAction:decisionHandler:)])
        
       policy =  [realDelegate webView:webView decidePolicyForNavigationAction:navigationAction decisionHandler:decisionHandler];
        
        WKNavigationActionPolicy (^block)(WKWebView *, WKNavigationAction *, WKNavigationActionPolicy) = [self blockImplementationForMethod:_cmd]];
        if (block) {
            policy &= block(webView,navigationAction, decisionHandler);
        }

    decisionHandler(policy);
    
}

//- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
//    BOOL ret = YES;
//
//    id realDelegate = self.realDelegate;
//    if (realDelegate && [realDelegate respondsToSelector:@selector(webView:shouldStartLoadWithRequest:navigationType:)])
//        ret = [realDelegate webView:webView shouldStartLoadWithRequest:request navigationType:navigationType];
//
//    BOOL (^block)(UIWebView *, NSURLRequest *, UIWebViewNavigationType) = [self blockImplementationForMethod:_cmd];
//    if (block)
//        ret &= block(webView, request, navigationType);
//
//    return ret;
//}
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
    id realDelegate = self.realDelegate;
    if (realDelegate && [realDelegate respondsToSelector:@selector(webView:didCommitNavigation:)])
        [realDelegate webView:webView didCommitNavigation:navigation];

    void (^block)(WKWebView *) = [self blockImplementationForMethod:_cmd];
    if (block) block(webView);
    
    
}
//- (void)webViewDidStartLoad:(UIWebView *)webView {
//    id realDelegate = self.realDelegate;
//    if (realDelegate && [realDelegate respondsToSelector:@selector(webViewDidStartLoad:)])
//        [realDelegate webViewDidStartLoad:webView];
//
//    void (^block)(UIWebView *) = [self blockImplementationForMethod:_cmd];
//    if (block) block(webView);
//}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    id realDelegate = self.realDelegate;
    if (realDelegate && [realDelegate respondsToSelector:@selector(webView:didFinishNavigation::)])
        [realDelegate webView:webView didFinishNavigation:navigation];

    void (^block)(WKWebView *) = [self blockImplementationForMethod:_cmd];
    if (block) block(webView);
}
//- (void)webViewDidFinishLoad:(UIWebView *)webView {
//    id realDelegate = self.realDelegate;
//    if (realDelegate && [realDelegate respondsToSelector:@selector(webViewDidFinishLoad:)])
//        [realDelegate webViewDidFinishLoad:webView];
//
//    void (^block)(UIWebView *) = [self blockImplementationForMethod:_cmd];
//    if (block) block(webView);
//}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    
    id realDelegate = self.realDelegate;
    if (realDelegate && [realDelegate respondsToSelector:@selector(webView:didFailNavigation:withError:)])
        [realDelegate webView:webView didFailNavigation:navigation withError:error];

    void (^block)(WKWebView *, NSError *) = [self blockImplementationForMethod:_cmd];
    if (block) block(webView, error);
    
}
//- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
//    id realDelegate = self.realDelegate;
//    if (realDelegate && [realDelegate respondsToSelector:@selector(webView:didFailLoadWithError:)])
//        [realDelegate webView:webView didFailLoadWithError:error];
//
//    void (^block)(UIWebView *, NSError *) = [self blockImplementationForMethod:_cmd];
//    if (block) block(webView, error);
//}

@end

#pragma mark Category

@implementation WKWebView (BlocksKit)

//@dynamic bk_shouldStartLoadBlock, bk_didStartLoadBlock, bk_didFinishLoadBlock, bk_didFinishWithErrorBlock;
@dynamic bk_decidePolicyForNavigationActionBlock, bk_didCommitNavigationBlock, bk_didFinishNavigationBlock, bk_didFailNavigationBlock;

+ (void)load
{
    @autoreleasepool {
        [self bk_registerDynamicDelegate];
//        [self bk_linkDelegateMethods:@{
//            @"bk_shouldStartLoadBlock": @"webView:shouldStartLoadWithRequest:navigationType:",
//            @"bk_didStartLoadBlock": @"webViewDidStartLoad:",
//            @"bk_didFinishLoadBlock": @"webViewDidFinishLoad:",
//            @"bk_didFinishWithErrorBlock": @"webView:didFailLoadWithError:"
//        }];
        [self bk_linkDelegateMethods:@{
            @"bk_decidePolicyForNavigationActionBlock":@"webView:decidePolicyForNavigationAction:decisionHandler:",
            @"bk_didCommitNavigationBlock":@"webView:didCommitNavigation:",
            @"bk_didFinishNavigationBlock":@"webView:didFinishNavigation::",
            @"bk_didFailNavigationBlock":@"webView:didFailNavigation:withError:"
        }];
    }
}

@end
