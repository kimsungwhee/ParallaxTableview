//
//  ViewController.m
//  ParallaxTableview
//
//  Created by kimsungwhee on 12-8-28.
//
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,assign)CGFloat  headerImageYOffset;
@end

@implementation ViewController
static CGFloat WindowHeight = 110;
//static CGFloat ImageHeight  = 330;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.headerImageYOffset = -100.0f;
    self.myImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image"]];
    self.myImageView.frame = CGRectMake(0, self.headerImageYOffset, self.view.frame.size.width, 300);
    
    self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.myTableView.backgroundColor = [UIColor clearColor];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    [self.view addSubview:self.myImageView];
    [self.view addSubview:self.myTableView];
    

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0) {
        return 2;
    } else {
        return 2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return WindowHeight;
    } else { return 44;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"WindowReuseIdentifier"];
        if (!cell) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WindowReuseIdentifier"];
            cell.backgroundColor             = [UIColor clearColor];
            cell.contentView.backgroundColor = [UIColor clearColor];
            cell.selectionStyle              = UITableViewCellSelectionStyleNone;
        }
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableViewCell"];
            cell.contentView.backgroundColor = [UIColor whiteColor];
            if (indexPath.row ==0)
            {
                cell.textLabel.text = @"Ahmed Eid";
            } else if (indexPath.row ==1) {
                cell.textLabel.text = @"TMNT Rule";
            }
        }
    }
    return cell;
}

#pragma mark - Scrollview Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat scrollOffset = scrollView.contentOffset.y;
    CGRect headerImageFrame = self.myImageView.frame;

    if (scrollOffset < 0) {
        headerImageFrame.origin.y = _headerImageYOffset - ((scrollOffset / 2));
    } else {
        headerImageFrame.origin.y = _headerImageYOffset - scrollOffset;
    }
    self.myImageView.frame = headerImageFrame;
}
@end
