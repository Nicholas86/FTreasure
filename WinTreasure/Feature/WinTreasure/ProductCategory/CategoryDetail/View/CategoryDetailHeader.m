//
//  CategoryDetailHeader.m
//  WinTreasure
//
//  Created by Apple on 16/6/7.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "CategoryDetailHeader.h"

const CGFloat kDefaultMargin = 12.0;
const CGFloat kAddListButtonWidth = 100.0;
const CGFloat kDefaultHeight = 44.0;

@implementation CategoryDetailHeader

+ (instancetype)header {
    CategoryDetailHeader *header = [[CategoryDetailHeader alloc]initWithFrame:({
        CGRect rect = {0, 0, kScreenWidth, kDefaultHeight};
        rect;
    })];
    return header;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColorHex(0xF5F6F6);
        self.height = kDefaultHeight;
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    _addListBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _addListBtn.exclusiveTouch = YES;
    _addListBtn.origin = CGPointMake(kScreenWidth-kDefaultMargin-kAddListButtonWidth, 0);
    _addListBtn.size = CGSizeMake(kAddListButtonWidth, self.height);
    _addListBtn.titleLabel.font = SYSTEM_FONT(14);
    _addListBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [_addListBtn setTitle:@"全部加入清单" forState:UIControlStateNormal];
    [_addListBtn setTitleColor:kDefaultColor forState:UIControlStateNormal];
    [_addListBtn addTarget:self action:@selector(addList) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_addListBtn];
    
    _amountLabel = [YYLabel new];
    _amountLabel.origin = CGPointMake(kDefaultMargin, 0);
    _amountLabel.size = CGSizeMake(kAddListButtonWidth, self.height);
    _amountLabel.font = SYSTEM_FONT(14);
    _amountLabel.textColor = UIColorHex(666666);
    _amountLabel.text = @"共很多件商品";
    [_amountLabel sizeToFit];
    [self addSubview:_amountLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _addListBtn.centerY = self.centerY;
    _amountLabel.centerY = self.centerY;
}


- (void)addList {
    if (_addListBlock) {
        _addListBlock();
    }
}

+ (CGFloat)headerHeight {
    return kDefaultHeight;
}

@end
