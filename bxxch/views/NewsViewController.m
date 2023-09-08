# import "NewsViewController.h"
# import "MyTableViewCell.h"

// Table 教学
@interface NewsViewController()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation NewsViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"News";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like@2x"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected@2x"];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Table View
    UITableView *table = [[UITableView alloc] initWithFrame:(self.view.bounds)];
    // 代理数据源
    table.dataSource = self;
    // Table 点击行为，滚动行为，出现消失时机，设置高度、headers、footers，此类的代理行为
    table.delegate = self;
    [self.view addSubview: table];
}

// Table 行数(datasource)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

// Table 样式（datasource）
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 复用回收池
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    NSString *title = @"啊哈哈哈哈";
    NSString *source = @"USA";
    NSString *comment = @"MJJ";
    NSString *time = @"2018";
    // 设置图片
    UIImage *pic = [UIImage imageNamed:@"webcast_logo"];
    
    [cell setLabelText:title source:source comment:comment time:time];
    [cell setRightImage:pic];
    // 获取当前行位置
//    NSString *cellTitle = [NSString stringWithFormat:@"Hello Cell - %@", @(indexPath.row)];
    // Cell 样式配置对象
//    UIListContentConfiguration *config = [UIListContentConfiguration cellConfiguration];
//    config.text = cellTitle;
//    config.secondaryText = @"Subtitle";
//    config.image = [UIImage imageNamed:@"icon.bundle/video@2x"];
//    config.imageProperties.maximumSize = CGSizeMake(44.0, 44.0);

//    cell.contentConfiguration = config;
    return cell;
}

// 设置高度（delegate）
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

// 点击事件（delegate）
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *popView = [[UIViewController alloc] init];
    popView.navigationItem.title = [NSString stringWithFormat:@"Hello Table %@", @(indexPath.row)];
    popView.view.backgroundColor = UIColor.whiteColor;
    [self.navigationController pushViewController:popView animated:true];
}


@end
