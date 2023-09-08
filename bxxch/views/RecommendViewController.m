//
//  ViewController.m
//  bxxch
//
//  Created by ByteDance on 2023/6/21.
//

#import "RecommendViewController.h"
// 测试生命周期，继承至 UIView
@interface ViewLifeCycleTest: UIView

@end

@implementation ViewLifeCycleTest

- (instancetype)init {
    self = [super init];
    if (self) {}
    return self;
}

- (void)willMoveToSuperview:(nullable UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    NSString *message = @"willMoveToSuperview";
    NSLog(@"%@", message);
}
- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    NSString *message = @"didMoveToSuperview";
    NSLog(@"%@", message);
}
- (void)willMoveToWindow:(nullable UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
    NSString *message = @"willMoveToWindow";
    NSLog(@"%@", message);
}
- (void)didMoveToWindow {
    [super didMoveToWindow];
    NSString *message = @"didMoveToWindow";
    NSLog(@"%@", message);
}

@end


// 展示层内容

@interface RecommendViewController ()

@end

@implementation RecommendViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"Recommend";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/video@2x"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/video_selected@2x"];
    }
    return self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 点击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];

    self.view.backgroundColor = UIColor.whiteColor;
    // 最基本的 UIView
    ViewLifeCycleTest *redSquare = [[ViewLifeCycleTest alloc] init];
    redSquare.backgroundColor = UIColor.redColor;
    redSquare.frame = CGRectMake(0, 0, 100, 100);
    
    UIView *buleSquare = [[UIView alloc] init];
    buleSquare.backgroundColor = UIColor.blueColor;
    buleSquare.frame = CGRectMake(50, 50, 100, 100);
    
    UIView *greenSquare = [[UIView alloc] init];
    greenSquare.backgroundColor = UIColor.greenColor;
    greenSquare.frame = CGRectMake(80, 80, 100, 100);
    [greenSquare addGestureRecognizer:tap];

    [self.view addSubview:redSquare];
    [self.view addSubview:buleSquare];
    [self.view addSubview:greenSquare];
}

- (void) pushController {
    
    UIViewController *popView = [[UIViewController alloc] init];
    popView.view.backgroundColor = UIColor.whiteColor;
    popView.navigationItem.title = @"POP";
    // 新页面入栈
    [self.navigationController pushViewController:popView animated:true];
    NSLog(@"Click Square");
}

@end
