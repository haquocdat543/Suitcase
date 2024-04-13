const { EC2Client, DescribeInstancesCommand } = require("@aws-sdk/client-ec2");

// Replace with your AWS credentials
const credentials = {
  region: "ap-northeast-1",
  accessKeyId: "",
  secretAccessKey: "",
};

const ec2Client = new EC2Client(credentials);

const describeInstancesCommand = new DescribeInstancesCommand({});

ec2Client.send(describeInstancesCommand)
  .then((data) => {
    const reservations = data.Reservations;
    reservations.forEach((reservation) => {
      const instances = reservation.Instances;
      instances.forEach((instance) => {
        console.log("Instance ID:", instance.InstanceId);
        console.log("Instance State:", instance.State.Name);
        console.log("Instance image ID:", instance.ImageId);
        console.log("Instance Type:", instance.InstanceType);
        console.log("Public IP Address:", instance.PublicIpAddress || "N/A");
        console.log("Private IP Address:", instance.PrivateIpAddress || "N/A");
        console.log("-----------------------------------------");
      });
    });
  })
  .catch((error) => {
    console.error(error);
  });

