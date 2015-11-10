//
//  T8MessageItem.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/9.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8MessageItem.h"
#import "T8MessageModel.h"
#import "T8MessageViewModel.h"
#import "T8TextMessageViewModel.h"
#import "T8ChatBaseCollectionViewCell.h"

@interface T8MessageItem ()
{
    __weak T8ChatBaseCollectionViewCell *_cell;
}

@end

@implementation T8MessageItem

- (instancetype)initWithMessage:(T8MessageModel *)message
{
    self = [super init];
    if (self) {
        _message = message;
    }
    return self;
}

- (T8MessageViewModel *)viewModel
{
    return _viewModel;
}

- (CGSize)sizeForContainerSize:(CGSize)containerSize
{
    return CGSizeMake(containerSize.width, [self viewModelForContainerSize:containerSize].frame.size.height);
}

- (T8MessageViewModel *)viewModelForContainerSize:(CGSize)containerSize
{
    if (_viewModel == nil) {
        _viewModel = [self createMessageViewModel:_message containerSize:containerSize];
    }
    
    return _viewModel;
}

- (T8MessageViewModel *)createMessageViewModel:(T8MessageModel *)message containerSize:(CGSize)containerSize
{
    if (message.type == 1) {
        T8TextMessageViewModel *textViewModel = [[T8TextMessageViewModel alloc] initWithMessage:message];
        [textViewModel layoutForContainerSize:containerSize];
        return textViewModel;
    }
    
    return nil;
}

- (void)bindCell:(T8ChatBaseCollectionViewCell *)cell
{
    _cell = cell;
    _cell.boundItem = self;
    
    [_viewModel bindViewToContainer:[cell contentViewForBinding]];
}

- (void)unbindCell
{
    if (_cell.boundItem == self) {
        _cell.boundItem = nil;
    }
    _cell = nil;
}

@end