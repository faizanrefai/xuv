//
//  Email.m
//  HairStyleProj
//
//  Created by Vivek Rajput on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Email.h"

#import "Client_Relation.h"

@implementation Email

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
	self.navigationController.navigationBar.hidden=TRUE;
	
	
	self.title=@"E-Mail";
	

}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
-(IBAction)done:(id)sender{

	UIAlertView *allert1=[[UIAlertView alloc]initWithTitle:@"Select" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Send and Save as Template",@"Send Only",nil];
	[allert1 show];
	[allert1 release];
	

}


- (IBAction)showPicker:(id)sender {
	
    ABPeoplePickerNavigationController *picker =[[ABPeoplePickerNavigationController alloc] init];
	
    picker.peoplePickerDelegate = self;
	
	
	
    [self presentModalViewController:picker animated:YES];
	
    [picker release];
	
}
- (void)peoplePickerNavigationControllerDidCancel:

(ABPeoplePickerNavigationController *)peoplePicker {
	
    [self dismissModalViewControllerAnimated:YES];
	
}

-(IBAction)back{

	[self.navigationController popViewControllerAnimated:YES];	

}



- (BOOL)peoplePickerNavigationController:

(ABPeoplePickerNavigationController *)peoplePicker

      shouldContinueAfterSelectingPerson:(ABRecordRef)person {
	
	
	
    NSString* name = (NSString *)ABRecordCopyValue(person,
												   
												   kABPersonFirstNameProperty);
	
    firstName.text = name;
	
    [name release];
	
	
	
  	
	
	
    [self dismissModalViewControllerAnimated:YES];
	
	
	
    return NO;
	
}
- (BOOL)peoplePickerNavigationController:

(ABPeoplePickerNavigationController *)peoplePicker

      shouldContinueAfterSelectingPerson:(ABRecordRef)person

                                property:(ABPropertyID)property

                              identifier:(ABMultiValueIdentifier)identifier{
	
    return NO;
	
}
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

	//nslog(@"Id%d",buttonIndex);
	
	switch (buttonIndex) {
	case 1:
	{
		UIAlertView *allert2=[[UIAlertView alloc]initWithTitle:@"Select" message:nil delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"Overwriting Existing Template",@"Save as New Template",nil];
		[allert2 show];
		[allert2 release];
		
	}
		break;
	default:
		break;
}

}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
