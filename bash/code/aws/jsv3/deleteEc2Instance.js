const { EC2Client, TerminateInstancesCommand } = require("@aws-sdk/client-ec2");

// Replace with your AWS credentials
const credentials = {
  region: "ap-northeast-1",
  accessKeyId: "",
  secretAccessKey: "",
};

const ec2Client = new EC2Client(credentials);

const instanceId = "i-0c049d905ec11b8da"; // Replace with the ID of the instance to terminate

const terminateInstancesCommand = new TerminateInstancesCommand({
  InstanceIds: [instanceId],
});

ec2Client.send(terminateInstancesCommand)
  .then((data) => {
    console.log("Termination successful");
  })
  .catch((error) => {
    console.error(error);
  });

