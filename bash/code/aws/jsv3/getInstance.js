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
      });
    });
  })
  .catch((error) => {
    console.error(error);
  });

