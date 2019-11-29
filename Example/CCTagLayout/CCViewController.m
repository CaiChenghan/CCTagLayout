//
//  CCViewController.m
//  CCTagLayout
//
//  Created by 1178752402@qq.com on 11/29/2019.
//  Copyright (c) 2019 1178752402@qq.com. All rights reserved.
//

#import "CCViewController.h"
#import <SDAutoLayout/SDAutoLayout.h>
#import "CCTagView.h"

@interface CCViewController ()

@property (nonatomic, strong) CCTagView *tagView;

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tagView];
    self.tagView.sd_layout
    .topEqualToView(self.view)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .autoHeightRatio(0);
}

- (CCTagView *)tagView {
    if (_tagView == nil) {
        _tagView = [[CCTagView alloc]initWithFrame:CGRectZero];
        _tagView.backgroundColor = [UIColor purpleColor];
    }
    return _tagView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
