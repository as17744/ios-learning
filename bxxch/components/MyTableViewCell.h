//
//  MyTableViewCell.h
//  bxxch
//
//  Created by ByteDance on 2023/8/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell : UITableViewCell

- (void)setLabelText:(NSString *)title source:(NSString *)source comment:(NSString *)comment time:(NSString *)time;

- (void)setRightImage:(UIImage *)pic;
@end

NS_ASSUME_NONNULL_END
