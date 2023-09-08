# import "SettingsViewController.h"

@interface SettingsViewController()<UIScrollViewDelegate>

@end

@implementation SettingsViewController

- (instancetype) init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"Settings";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *colorList = @[UIColor.greenColor, UIColor.redColor, UIColor.blueColor, UIColor.tintColor, UIColor.orangeColor];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2);
    scrollView.backgroundColor = UIColor.grayColor;
    [self.view addSubview:scrollView];
    for (int i = 0; i < 5; i++) {
        UIView *square = [[UIView alloc] init];
        square.backgroundColor = [colorList objectAtIndex:i];
        square.frame = CGRectMake(0, 100 * i, 100, 100);
        [scrollView addSubview:square];
    }
    scrollView.pagingEnabled = true;
//    NSString *viewTitle = @"Settings";
//    UILabel *label = [[UILabel alloc] init];
//    label.frame = CGRectMake(100, 100, 200, 200);
//    label.text = viewTitle;
//    self.view.backgroundColor = UIColor.whiteColor;
//    [self.view addSubview:label];
}

// delegate Scroll View
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset API_AVAILABLE(ios(5.0)) {
//    NSString *dragTip = [NSString stringWithFormat:@"Dragging %@", @(targetContentOffset.width)];
    NSLog(@"Drag End");
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"Drag Begin");
}



@end
