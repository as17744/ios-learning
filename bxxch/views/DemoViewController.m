# import "DemoViewController.h"

@interface DemoViewController()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *viewTitle = @"Tab1";
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(100, 100, 200, 200);
    label.text = viewTitle;
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:label];
}


@end
