//
//  BaseTableView.h
//  FW
//
//  Created by Bright on 16/5/18.
//  Copyright © 2016年 yunlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableView : UITableView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) NSMutableArray *dataMArr;/**< 数据源数组 */
@property(nonatomic,strong) void(^selectCellBlock)(UITableViewCell *,NSIndexPath *);
@end
