//
//  ViewController.h
//  ParallaxTableview
//
//  Created by kimsungwhee on 12-8-28.
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * myTableView;
@property(nonatomic,strong)UIImageView * myImageView;
@end
