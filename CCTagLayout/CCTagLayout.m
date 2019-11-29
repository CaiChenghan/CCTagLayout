//
//  CCTagLayout.m
//  MyLabelDemo
//
//  Created by 蔡成汉 on 2019/11/27.
//  Copyright © 2019 蔡成汉. All rights reserved.
//

#import "CCTagLayout.h"

@interface CCTagLayout ()

@property (nonatomic, strong) NSMutableDictionary *layoutDic;
@property (nonatomic, assign) CGSize contentSize;

@end

@implementation CCTagLayout

- (instancetype)init {
    self = [super init];
    if (self) {
        _layoutDic = [NSMutableDictionary dictionary];
        _contentSize = CGSizeZero;
    }
    return self;
}

- (void)prepareLayout {
    [super prepareLayout];
    
    // 获取对象，进行布局，存储布局信息
    NSInteger sections = [self.collectionView numberOfSections];
    CGFloat width = self.collectionView.bounds.size.width;
    CGFloat x = 0;
    CGFloat y = 0;
    for(NSInteger section = 0; section < sections; section++) {
        CGFloat itemSpacing = [self minimumInteritemSpacingForSectionAtIndex:section];
        CGFloat lineSpacing = [self minimumLineSpacingForSectionAtIndex:section];
        UIEdgeInsets sectionInset = [self insetForSectionAtIndex:section];
        x = sectionInset.left;
        y = y + sectionInset.top;
        NSInteger items = [self.collectionView numberOfItemsInSection:section];
        for (NSInteger item = 0; item < items; item ++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
            CGSize tpSize = [((id<CCTagLayoutDelegate>)self.collectionView.delegate) collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
            CGSize itemSize = CGSizeMake(MIN(tpSize.width, width - sectionInset.left - sectionInset.right), tpSize.height);
            CGRect frame = CGRectMake(x, y, itemSize.width, itemSize.height);
            CGFloat _itemSpacing = item == 0 ? 0 : itemSpacing;
            if (x + _itemSpacing + itemSize.width < width - sectionInset.right) {
                x = x + itemSpacing + itemSize.width;
            } else if (x + _itemSpacing + itemSize.width == width - sectionInset.right) {
                x = sectionInset.left;
                y = y + itemSize.height + lineSpacing;
            } else {
                x = sectionInset.left;
                y = y + itemSize.height + lineSpacing;
                frame.origin.x = x;
                frame.origin.y = y;
            }
            if (item == items - 1) {
                y = y + itemSize.height + sectionInset.bottom;
            }
            self.layoutDic[indexPath] = NSStringFromCGRect(frame);
            if (section == sections - 1 && item == items - 1) {
                self.contentSize = CGSizeMake(width, frame.origin.y + frame.size.height + sectionInset.bottom);
                if (self.contentSizeCallBack) {
                    self.contentSizeCallBack(self.contentSize);
                }
            }
        }
    }
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (CGSize)collectionViewContentSize {
    return self.contentSize;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray* attributesArray = [NSMutableArray array];
    NSInteger sections = [self.collectionView numberOfSections];
    for (NSInteger section = 0; section < sections; section ++) {
        NSInteger items = [self.collectionView numberOfItemsInSection:section];
        for (NSInteger item = 0 ; item < items; item++) {
            NSIndexPath* indexPath = [NSIndexPath indexPathForItem:item inSection:section];
            UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
            attributes.frame = CGRectFromString(self.layoutDic[indexPath]);
            if (CGRectIntersectsRect(rect, attributes.frame)) {
                [attributesArray addObject:attributes];
            }
        }
    }
    return attributesArray;
}

- (CGFloat)minimumInteritemSpacingForSectionAtIndex:(NSInteger)sectionIndex {
    if ([self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]) {
        return [(id<CCTagLayoutDelegate>)self.collectionView.delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:sectionIndex];
    } else {
        return self.minimumInteritemSpacing;
    }
}

- (CGFloat)minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if ([self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:minimumLineSpacingForSectionAtIndex:)]) {
        return [(id<CCTagLayoutDelegate>)self.collectionView.delegate collectionView:self.collectionView layout:self minimumLineSpacingForSectionAtIndex:section];
    } else {
        return self.minimumLineSpacing;
    }
}

- (UIEdgeInsets)insetForSectionAtIndex:(NSInteger)section {
    if ([((id<CCTagLayoutDelegate>)self.collectionView.delegate) respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
        return [((id<CCTagLayoutDelegate>)self.collectionView.delegate) collectionView:self.collectionView layout:self insetForSectionAtIndex:section];
    } else {
        return self.sectionInset;
    }
}

@end
