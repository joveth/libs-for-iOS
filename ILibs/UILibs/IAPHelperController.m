//
//  IAPHelperController.m
//  ILibs
//
//  Created by Shuwei on 15/10/27.
//  Copyright © 2015年 jov. All rights reserved.
//

#import "IAPHelperController.h"
#import "MBProgressHUD.h"
@interface IAPHelperController ()

@end

@implementation IAPHelperController{
    MBProgressHUD *hud;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    hud = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:hud];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2-100, self.view.frame.size.width, 100)];
    [btn setTitle:@"Click me to purchase" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(requestPurchase) forControlEvents:UIControlEventTouchUpInside];
    self.view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2+50, self.view.frame.size.width, 100)];
    [btn1 setTitle:@"Restore Purchase" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(requestRestore) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)requestPurchase{
    [hud show:YES];
    if(![IAPShare sharedHelper].iap) {
        NSSet* dataSet = [[NSSet alloc] initWithObjects:@"com.jov.libs.product", nil];
        
        [IAPShare sharedHelper].iap = [[IAPHelper alloc] initWithProductIdentifiers:dataSet];
    }
    
    [IAPShare sharedHelper].iap.production = NO;
    
    [[IAPShare sharedHelper].iap requestProductsWithCompletion:^(SKProductsRequest* request,SKProductsResponse* response)
     {
         if(response > 0 ) {
             SKProduct* product =[[IAPShare sharedHelper].iap.products objectAtIndex:0];
             
             [[IAPShare sharedHelper].iap buyProduct:product
                                        onCompletion:^(SKPaymentTransaction* trans){
                                            
                                            if(trans.error)
                                            {
                                                [Common showMessageWithOkButton:[trans.error localizedDescription]];
                                              
                                                [hud hide:YES];
                                            }
                                            else if(trans.transactionState == SKPaymentTransactionStatePurchased) {
                                                
                                                [[IAPShare sharedHelper].iap checkReceipt:trans.transactionReceipt onCompletion:^(NSString *response, NSError *error) {
                                                    
                                                    //Convert JSON String to NSDictionary
                                                    NSDictionary* rec = [IAPShare toJSON:response];
                                                    
                                                    if([rec[@"status"] integerValue]==0)
                                                    {
                                                        NSString *productIdentifier = trans.payment.productIdentifier;
                                                        [[IAPShare sharedHelper].iap provideContent:productIdentifier];
                                                        NSLog(@"SUCCESS %@",response);
                                                        NSLog(@"Pruchases %@",[IAPShare sharedHelper].iap.purchasedProducts);
                                                        [hud hide:YES];
                                                    }
                                                    else {
                                                        NSLog(@"Fail");
                                                        [hud hide:YES];
                                                    }
                                                }];
                                            }
                                            else if(trans.transactionState == SKPaymentTransactionStateFailed) {
                                                NSLog(@"Fail");
                                                [hud hide:YES];
                                            }
                                        }];//end of buy product
         }else{
             [hud hide:YES];
         }
     }];
}
-(void)requestRestore{
//    [hud show:YES];
//    [[IAPShare sharedHelper].iap restoreProductsWithCompletion:^(SKPaymentQueue *payment, NSError *error) {
//         [hud hide:YES];
//        if(error){
//            [Common showMessageWithOkButton:@"Error happend,please check it later."];
//            return;
//        }
//        //check with SKPaymentQueue
//        
//        // number of restore count
//        int numberOfTransactions = payment.transactions.count;
//        
//        for (SKPaymentTransaction *transaction in payment.transactions)
//        {
//            NSString *purchased = transaction.payment.productIdentifier;
//            if([purchased isEqualToString:@"com.jov.libs.product"]){
//                [Common showMessageWithOkButton:@"You had purchased this product!"];
//                return;
//            }
//        }
//        [Common showMessageWithOkButton:@"You did't purchased this product!"];
//    }];
    if([[IAPShare sharedHelper].iap isPurchasedProductsIdentifier:@"com.jov.libs.product"])
    {
          [Common showMessageWithOkButton:@"You had purchased this product!"];
    }else{
        [Common showMessageWithOkButton:@"You did't purchased this product!"];
    }
}

@end
