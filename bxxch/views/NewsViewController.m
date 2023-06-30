# import "NewsViewController.h"

@interface NewsViewController()

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *viewTitle = @"Tab2";
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(100, 100, 200, 200);
    label.text = viewTitle;
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:label];
}


@end
