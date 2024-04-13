// Import the AWS SDK
const AWS = require('aws-sdk');

// Configure AWS credentials and region
AWS.config.update({
  accessKeyId: '',
  secretAccessKey: '',
  region: 'ap-northeast-1'
});

// Create an EC2 service object
const ec2 = new AWS.EC2();

// Define parameters for DescribeInstances API call
const params = {
  DryRun: false
};

// Call the DescribeInstances operation
ec2.describeInstances(params, (err, data) => {
  if (err) {
    console.error("Error", err);
  } else {
    // Extract information about instances from the response
    const instances = data.Reservations.reduce((acc, reservation) => {
      return acc.concat(reservation.Instances);
    }, []);

    // Print information about each instance
    instances.forEach(instance => {
      console.log("Instance ID:", instance.InstanceId);
      console.log("Instance Type:", instance.InstanceType);
      console.log("Instance State:", instance.State.Name);
      console.log("Public IP Address:", instance.PublicIpAddress || "N/A");
      console.log("Private IP Address:", instance.PrivateIpAddress || "N/A");
      console.log("-----------------------------------------");
    });
  }
});
