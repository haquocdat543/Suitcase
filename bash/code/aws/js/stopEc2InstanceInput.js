// Import the AWS SDK
const AWS = require('aws-sdk');
const readline = require('readline');

// Configure AWS credentials and region
AWS.config.update({
  accessKeyId: '',
  secretAccessKey: '',
  region: 'ap-northeast-1'
});

// Create an EC2 service object
const ec2 = new AWS.EC2();

// Create readline interface for user input
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Ask the user to enter instance IDs
rl.question('Enter instance IDs (comma-separated): ', (instanceIds) => {
  // Define parameters for the StopInstances API call
  const params = {
    InstanceIds: instanceIds.split(',').map(id => id.trim()) // Array of instance IDs to stop
  };

  // Call the StopInstances operation
  ec2.stopInstances(params, (err, data) => {
    if (err) {
      console.error("Error", err);
    } else {
      console.log("Success", data.StoppingInstances);
    }
    rl.close(); // Close readline interface
  });
});
