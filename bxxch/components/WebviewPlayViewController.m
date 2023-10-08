//
//  WebviewPlayViewController.m
//  bxxch
//
//  Created by ByteDance on 2023/10/7.
//

#import "WebviewPlayViewController.h"

@interface WebviewPlayViewController ()<WKNavigationDelegate>

@property(nonatomic, strong, readwrite) WKWebView *playgroundWeb;
@property(nonatomic, strong, readwrite) UIProgressView *progressView;

@end

@implementation WebviewPlayViewController

//- (instancetype)init {
//    self = [super init];
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加 Webview
    [self.view addSubview:({
        self.playgroundWeb = [[WKWebView alloc] initWithFrame:CGRectMake(0, 120, self.view.frame.size.width, self.view.frame.size.height - 120)];
        self.playgroundWeb.navigationDelegate = self;
        // 添加观察者
        [self.playgroundWeb addObserver:self forKeyPath:@"estimatedProgress" options:(NSKeyValueObservingOptionNew) context:nil];
        self.playgroundWeb;
    })];
    // 添加 ProgressView
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 120, self.view.frame.size.width, 20)];
        self.progressView;
    })];
    // 封装 URL
    NSURL *url = [[NSURL alloc] initWithString:@"https://tosv.byted.org/obj/gecko-internal/webcast/external/playround/webcast_external_playground/react-16-playground/html/index/index.html"];
    // 封装请求
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
    // 发起 URL 请求
    [self.playgroundWeb loadRequest:req];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler WK_SWIFT_ASYNC(3) {
    NSLog(@"decidePolicyForNavigationAction");
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"didFinishNavigation");
}

// 销毁时要移除监听
- (void)dealloc {
    [self.playgroundWeb removeObserver:self forKeyPath:@"estimatedProgress"];
}

// 观察者的会调函数
- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context {
    self.progressView.progress = self.playgroundWeb.estimatedProgress;
    // 移除进度条
    if (self.progressView.progress >= 1) {
        [self.progressView removeFromSuperview];
    }
    NSLog(@"111 %f", self.playgroundWeb.estimatedProgress);
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
