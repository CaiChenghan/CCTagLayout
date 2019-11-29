//
//  CCTagCell.m
//  CCTagLayout
//
//  Created by 1178752402@qq.com on 11/29/2019.
//  Copyright (c) 2019 1178752402@qq.com. All rights reserved.
//

#import "CCTagCell.h"
#import <SDAutoLayout/SDAutoLayout.h>

@interface CCTagCell ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation CCTagCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor yellowColor];
        [self initialView];
        [self makeConstraints];
    }
    return self;
}

- (void)initialView {
    [self.contentView addSubview:self.label];
}

- (void)makeConstraints {
    self.label.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
}

- (void)setText:(NSString *)text {
    _text = text;
    self.label.text = _text;
}

- (UILabel *)label {
    if (_label == nil) {
        _label = [[UILabel alloc]init];
        _label.textColor = [UIColor blackColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:13];
    }
    return _label;
}

@end
