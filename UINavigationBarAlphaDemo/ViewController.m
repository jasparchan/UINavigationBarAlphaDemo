//
//  ViewController.m
//  UINavigationBarAlphaDemo
//
//  Created by fangdr on 2017/2/20.
//
//

#import "ViewController.h"
#import "UINavigationBar+RBAlpha.h"
static float NavigationBarAlphaOffset = 200;

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar rb_setNavigationBarBackgroundColor:[UIColor clearColor]];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self scrollViewDidScroll:self.tableView];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setShadowImage:nil];
    [self.navigationController.navigationBar rb_reset];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView) {
        float alpha = MIN(1, scrollView.contentOffset.y / NavigationBarAlphaOffset);
        [self.navigationController.navigationBar rb_setNavigationBarBackgroundColor:[[UIColor purpleColor] colorWithAlphaComponent:alpha]];
//        [self.navigationController.navigationBar rb_setNavigationBarAlpha:alpha];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
