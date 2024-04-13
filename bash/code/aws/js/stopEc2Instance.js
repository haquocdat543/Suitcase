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

// Define parameters for the StopInstances API call
const params = {
  InstanceIds: ['INSTANCE_ID'] // Array of instance IDs to stop
};

// Call the StopInstances operation
ec2.stopInstances(params, (err, data) => {
  if (err) {
    console.error("Error", err);
  } else {
    console.log("Success", data.StoppingInstances);
  }
});
