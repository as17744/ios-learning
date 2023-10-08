//
//  MyTableViewCell.m
//  bxxch
//
//  Created by ByteDance on 2023/8/8.
//

#import "MyTableViewCell.h"

@interface MyTableViewCell()

@property(nonatomic, strong, readwrite) UILabel *titleLabel;
@property(nonatomic, strong, readwrite) UILabel *sourceLabel;
@property(nonatomic, strong, readwrite) UILabel *commentLabel;
@property(nonatomic, strong, readwrite) UILabel *timeLabel;
@property(nonatomic, strong, readwrite) UIImageView *rightCellImage;
@property(nonatomic, strong, readwrite) UIButton *deleteButton;

@end

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier: reuseIdentifier ];
    if (self) {
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 300, 50)];
            self.titleLabel.backgroundColor = UIColor.redColor;
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = UIColor.blackColor;
            self.titleLabel;
        })];
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 50, 20)];
            self.sourceLabel.backgroundColor = UIColor.blueColor;
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = UIColor.grayColor;
            self.sourceLabel;
        })];
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 80, 50, 20)];
            self.commentLabel.backgroundColor = UIColor.greenColor;
            self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel.textColor = UIColor.grayColor;
            self.commentLabel;
        })];
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 80, 50, 20)];
            self.timeLabel.backgroundColor = UIColor.yellowColor;
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = UIColor.grayColor;
            self.timeLabel;
        })];
        [self.contentView addSubview:({
//            UIImageView *myImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"myImage.png"]];
            self.rightCellImage = [[UIImageView alloc] initWithFrame:CGRectMake(330, 15, 40, 40)];
            self.rightCellImage.backgroundColor = UIColor.orangeColor;
            // 设置图片适应方式
            self.contentMode = UIViewContentModeScaleToFill;
            self.rightCellImage;
//            self.timeLabel.backgroundColor = UIColor.yellowColor;
//            self.timeLabel.font = [UIFont systemFontOfSize:12];
//            self.timeLabel.textColor = UIColor.grayColor;
//            self.timeLabel;
        })];
        // 右下角 Button
        [self.contentView addSubview:({
            self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(350, 70, 20, 10)];
            self.deleteButton.backgroundColor = UIColor.blueColor;
            [self.deleteButton setTitle:@"X" forState:UIControlStateNormal];
            [self.deleteButton setTitle:@"C" forState:UIControlStateHighlighted];
            // 添加事件
            [self.deleteButton addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
            self.deleteButton;
        })];

    }
    return self;
}

- (void)deleteClick {
    NSLog(@"Delete Click");
}

- (void)setLabelText:(NSString *)title source:(NSString *)source comment:(NSString *)comment time:(NSString *)time {
    self.titleLabel.text = title;
    
    self.sourceLabel.text = source;
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = comment;
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 15,
                                         self.sourceLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    
    self.timeLabel.text = time;
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + 15,
                                      self.commentLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
}
//
- (void)setRightImage:(UIImage *)pic {
    self.rightCellImage.image = pic;
}

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
