//
//  CCTagLayout.h
//  MyLabelDemo
//
//  Created by 蔡成汉 on 2019/11/27.
//  Copyright © 2019 蔡成汉. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CCTagLayoutDelegate;

@interface CCTagLayout : UICollectionViewFlowLayout

@property (nonatomic, weak) id<CCTagLayoutDelegate> delegate;
@property (nonatomic, copy) void(^contentSizeCallBack)(CGSize contentSize);

@end


@protocol CCTagLayoutDelegate <UICollectionViewDelegateFlowLayout>

@required

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(CCTagLayout *)layout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

@end
