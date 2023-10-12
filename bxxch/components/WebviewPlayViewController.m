//
//  WebviewPlayViewController.m
//  bxxch
//
//  Created by ByteDance on 2023/10/7.
//

#import "WebviewPlayViewController.h"

@interface WebviewPlayViewController ()<WKNavigationDelegate, WKScriptMessageHandler>

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
        // webview -> webview configuration -> user controller -> user script
        NSString *jsSource = @"window.globalProps = { os: \"iOS\" }";
        // user script 放到文档位置设置
        WKUserScript *userScript = [[WKUserScript alloc] initWithSource:jsSource injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly: true];
        // user controller
        WKUserContentController *userController = [[WKUserContentController alloc] init];
        // 注入 JSB
        [userController addScriptMessageHandler:self name:@"showBlock"];
        // 添加 script 脚本
        [userController addUserScript:userScript];
        // webview 配置
        WKWebViewConfiguration *webConfig = [[WKWebViewConfiguration alloc] init];
        webConfig.userContentController = userController;
        // webview 初始化，长宽位置与注入配置
        self.playgroundWeb = [[WKWebView alloc] initWithFrame:CGRectMake(0, 120, self.view.frame.size.width, self.view.frame.size.height - 120)
            configuration:webConfig];
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
    NSURL *url = [[NSURL alloc] initWithString:@"http://10.70.247.252:5566/a/index.html"];
//    NSURL *url = [[NSURL alloc] initWithString:@"https://tosv.byted.org/obj/gecko-internal/webcast/external/playround/webcast_external_playground/react-16-playground/html/index/index.html"];
    // 封装请求
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
    // 发起 URL 请求
    [self.playgroundWeb loadRequest:req];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler WK_SWIFT_ASYNC(3) {
    NSLog(@"decidePolicyForNavigationAction");
    decisionHandler(WKNavigationActionPolicyAllow);
}

// 浏览器启动后注入 script，时机较晚
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation; {
    // 插入的 js
    NSString *jsSource = @"window.globalProps = { os: \"iOS\", appID: 123, appVersion: \"1.2.3\" }";
    [self.playgroundWeb evaluateJavaScript:jsSource completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error injecting global prop: %@", error);
        }
    }];
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

// JSB 调用的方法
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSLog(@"alog invoked %@", message.name);
    UIView *blockView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 100, self.view.frame.size.height / 2 - 100, 200, 200)];
    blockView.backgroundColor = UIColor.redColor;
    [self.view addSubview:blockView];
    
    NSString *callBack = message.body[@"callBack"]; //get callBack
    // 返回结果，字典类型
    NSDictionary *dict = @{
       @"key1": @"value1",
       @"key2": @"value2"
    };
    // 字典序列化
    id data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    // 转成 JSON 字符串
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    // 给 callback 传参数
    NSString *callbackInvokeString = [NSString stringWithFormat:@"(%@)(%@)", callBack, jsonString];
    // 调用 callback
    [self.playgroundWeb evaluateJavaScript:callbackInvokeString completionHandler:^(id _Nullable jsData, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error Happen In Callback: %@", error);
        }
    }];
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
