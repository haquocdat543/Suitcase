const { EC2Client, RunInstancesCommand } = require("@aws-sdk/client-ec2");

// Replace with your AWS credentials
const credentials = {
  region: "ap-northeast-1",
  accessKeyId: "",
  secretAccessKey: "",
};

const ec2Client = new EC2Client(credentials);

const runInstancesParams = {
  ImageId: "IMAGE_ID", // Replace with desired AMI ID for Linux T3 instance
  InstanceType: "t3.medium",
  MinCount: 1,
  MaxCount: 1,
  KeyName: "Window2", // Replace with your actual key pair name
  BlockDevices: [
    {
      DeviceName: "/dev/sdx", // Adjust if necessary based on your AMI
      Ebs: {
        VolumeSize: 60,
        VolumeType: "gp3",
      },
    },
  ],
};

const runInstancesCommand = new RunInstancesCommand(runInstancesParams);

ec2Client.send(runInstancesCommand)
  .then((data) => {
    console.log("Instance ID:", data.Instances[0].InstanceId);
  })
  .catch((error) => {
    console.error(error);
  });

