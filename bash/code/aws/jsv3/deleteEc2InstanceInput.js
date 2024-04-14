const { EC2Client, TerminateInstancesCommand } = require("@aws-sdk/client-ec2");
const { createInterface } = require('readline');

// Replace with your AWS credentials
const credentials = {
  region: "ap-northeast-1",
  accessKeyId: "",
  secretAccessKey: "",
};

const rl = createInterface({
  input: process.stdin,
  output: process.stdout
});

async function terminateInstance() {
  try {
    const ec2Client = new EC2Client(credentials);

    // Get instance ID from user input
    const question = "Enter the ID of the instance to terminate: ";
    const answer = await new Promise((resolve) => rl.question(question, resolve));

    if (!answer) {
      console.error("Please enter an instance ID.");
      return;
    }

    // Confirmation prompt for safety
    const confirmQuestion = `Are you sure you want to terminate instance with ID ${answer} (y/N)? `;
    const confirmation = await new Promise((resolve) => rl.question(confirmQuestion, resolve));

    if (confirmation.toLowerCase() !== 'y') {
      console.log("Termination cancelled.");
      return;
    }

    const terminateInstancesCommand = new TerminateInstancesCommand({
      InstanceIds: [answer],
    });

    await ec2Client.send(terminateInstancesCommand);
    console.log(`Instance with ID ${answer} termination initiated.`);
  } catch (error) {
    if (error.code === 'InvalidInstanceID.NotFound') {
      console.error(`Instance with ID ${answer} not found.`);
    } else {
      console.error("Termination failed:", error);
    }
  } finally {
    rl.close();
  }
}

terminateInstance();

