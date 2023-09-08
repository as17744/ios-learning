# import "DemoViewController.h"
// UICollectionView 示例
@interface DemoViewController()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation DemoViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"Home";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x"];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // CollectionView 的布局方式
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout: flow];
    // 行间距
    flow.minimumLineSpacing = 10;
    // 元素之间间距
    flow.minimumInteritemSpacing = 10;
    // 需要提前注册 cell class
    [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell-id"];
    collection.delegate = self;
    collection.dataSource = self;
    [self.view addSubview:collection];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell-id" forIndexPath:indexPath];
//    cell. = CGSizeMake(self.view.frame.size.width / 2, self.view.frame.size.width / 2)
    cell.backgroundColor = UIColor.blueColor;
    return cell;
}

// 来自 Layout Delegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 2) {
        return CGSizeMake((self.view.frame.size.width - 10) / 2 , 600);
    }
    return CGSizeMake((self.view.frame.size.width - 10) / 2 , 300);
}


@end
