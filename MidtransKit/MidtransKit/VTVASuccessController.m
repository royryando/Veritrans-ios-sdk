//
//  VTVASuccessController.m
//  MidtransKit
//
//  Created by Nanang Rafsanjani on 5/20/16.
//  Copyright © 2016 Veritrans. All rights reserved.
//

#import "VTVASuccessController.h"
#import "VTVAGuideController.h"
#import "VTPaymentStatusViewModel.h"

@interface VTVASuccessController ()
@property (strong, nonatomic) IBOutlet UILabel *vaNumberLabel;
@property (strong, nonatomic) IBOutlet UILabel *transactionTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *amountLabel;
@property (strong, nonatomic) IBOutlet UILabel *orderIdLabel;

@property (nonatomic) VTVATransactionStatusViewModel *viewModel;
@end

@implementation VTVASuccessController


- (instancetype)initWithViewModel:(VTVATransactionStatusViewModel *)viewModel {
    self = [[VTVASuccessController alloc] initWithNibName:@"VTVASuccessController" bundle:VTBundle];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.navigationItem setHidesBackButton:YES];
    
    _vaNumberLabel.text = _viewModel.vaNumber;
    _amountLabel.text = _viewModel.totalAmount;
    _orderIdLabel.text = _viewModel.orderId;
    _transactionTimeLabel.text = _viewModel.transactionTime;
    
    switch (_viewModel.vaType) {
        case VTVATypeBCA:
            self.title = @"BCA Bank Transfer";
            break;
        case VTVATypePermata:
            self.title = @"Permata Bank Transfer";
            break;
        case VTVATypeMandiri:
            self.title = @"Mandiri Bank Transfer";
            break;
        case VTVATypeOther:
            self.title = @"Other Bank Transfer";
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveVAPressed:(UIButton *)sender {
}
- (IBAction)helpPressed:(UIButton *)sender {
    VTVAGuideController *vc = [VTVAGuideController controllerWithVAType:_viewModel.vaType];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)finishPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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