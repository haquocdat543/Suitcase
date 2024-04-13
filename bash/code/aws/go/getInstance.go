package main

import (
	"fmt"
	"os"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/ec2"
)

func main() {
	// Create a new AWS session
	sess := session.Must(session.NewSessionWithOptions(session.Options{
		SharedConfigState: session.SharedConfigEnable,
	}))

	// Create a new EC2 service client
	svc := ec2.New(sess)

	// Create input parameters for DescribeInstances API call
	params := &ec2.DescribeInstancesInput{
		DryRun: aws.Bool(false),
	}

	// Call the DescribeInstances operation
	resp, err := svc.DescribeInstances(params)
	if err != nil {
		fmt.Println("Error", err)
		os.Exit(1)
	}

	// Print information about each instance
	for _, reservation := range resp.Reservations {
		for _, instance := range reservation.Instances {
			fmt.Println("Instance ID:", *instance.InstanceId)
			fmt.Println("Instance Type:", *instance.InstanceType)
			fmt.Println("Instance State:", *instance.State.Name)
			if instance.PublicIpAddress != nil {
				fmt.Println("Public IP Address:", *instance.PublicIpAddress)
			} else {
				fmt.Println("Public IP Address: N/A")
			}
			if instance.PrivateIpAddress != nil {
				fmt.Println("Private IP Address:", *instance.PrivateIpAddress)
			} else {
				fmt.Println("Private IP Address: N/A")
			}
			fmt.Println("-----------------------------------------")
		}
	}
}
