//
//  CCTagView.m
//  CCTagLayout
//
//  Created by 1178752402@qq.com on 11/29/2019.
//  Copyright (c) 2019 1178752402@qq.com. All rights reserved.
//

#import "CCTagView.h"
#import "CCTagCell.h"
#import <CCTagLayout/CCTagLayout.h>
#import <SDAutoLayout/SDAutoLayout.h>

@interface CCTagView ()<UICollectionViewDataSource,UICollectionViewDelegate,CCTagLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) CCTagLayout *layout;
@property (nonatomic, strong) NSArray *dataOne;
@property (nonatomic, strong) NSArray *dataTwo;

@end

@implementation CCTagView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialView];
        [self makeConstraints];
    }
    return self;
}

- (void)initialView {
    [self addSubview:self.collectionView];
}

- (void)makeConstraints {
    self.collectionView.sd_layout
    .topEqualToView(self)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(10);
    
    [self setupAutoHeightWithBottomView:self.collectionView bottomMargin:0];
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.layout];
        _collectionView.backgroundColor = [UIColor purpleColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[CCTagCell class] forCellWithReuseIdentifier:@"CCTagCell"];
        if (@available(iOS 11.0, *)) {
            _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _collectionView;
}

- (CCTagLayout *)layout {
    if (_layout == nil) {
        _layout = [[CCTagLayout alloc]init];
        _layout.minimumInteritemSpacing = 20;
        _layout.minimumLineSpacing = 10;
        _layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        _layout.delegate = self;
        __weak typeof(self) weakSelf = self;
        _layout.contentSizeCallBack = ^(CGSize contentSize) {
            weakSelf.collectionView.sd_layout
            .heightIs(contentSize.height);
        };
    }
    return _layout;
}

- (NSArray *)dataOne {
    if (_dataOne == nil) {
        _dataOne = @[@"七七七七七七七七七七七七七七七七七七七七七七七七七七七七七七七七七七七七七七七七七七",@"我的祖国",@"她"];
    }
    return _dataOne;
}

- (NSArray *)dataTwo {
    if (_dataTwo == nil) {
        _dataTwo = @[@"我",@"我的",@"那我的哦",@"她",@"哈哈",@"我的人"];
    }
    return _dataTwo;
}

#pragma mark - UICollectionViewDataSource,UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return self.dataOne.count;
    } else {
        return self.dataTwo.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CCTagCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CCTagCell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.text = self.dataOne[indexPath.row];
    } else {
        cell.text = self.dataTwo[indexPath.row];
    }
    return cell;
}

- (CGFloat)getWidthWithText:(NSString *)text height:(CGFloat)height font:(CGFloat)font
{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, 300)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}
                                     context:nil];
    return rect.size.width;
}

#pragma mark - CCTagLayoutDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(CCTagLayout *)layout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CGFloat itemWidth = [self getWidthWithText:self.dataOne[indexPath.row] height:30.0 font:13.0];
        itemWidth = MIN(itemWidth+20, collectionView.size.width - layout.sectionInset.left - layout.sectionInset.right);
        return CGSizeMake(itemWidth, 30.0);
    } else {
        CGFloat itemWidth = [self getWidthWithText:self.dataTwo[indexPath.row] height:30.0 font:13.0];
        itemWidth = MIN(itemWidth+20, collectionView.size.width - layout.sectionInset.left - layout.sectionInset.right);
        return CGSizeMake(itemWidth, 30.0);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
