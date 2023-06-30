# import "SettingsViewController.h"

@interface SettingsViewController()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *viewTitle = @"Settings";
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(100, 100, 200, 200);
    label.text = viewTitle;
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:label];
}


@end
