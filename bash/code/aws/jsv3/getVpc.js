const { EC2Client, DescribeVpcsCommand } = require("@aws-sdk/client-ec2");

// Replace with your AWS credentials
const credentials = {
  region: "ap-northeast-1",
  accessKeyId: "",
  secretAccessKey: "",
};

const ec2Client = new EC2Client(credentials);

const describeVpcsCommand = new DescribeVpcsCommand({});

ec2Client.send(describeVpcsCommand)
  .then((data) => {
    const vpcs = data.Vpcs;
    vpcs.forEach((vpc) => {
      console.log("VPC ID:", vpc.VpcId);
      // Add other VPC properties you're interested in, like tags or CIDR blocks
    });
  })
  .catch((error) => {
    console.error(error);
  });

