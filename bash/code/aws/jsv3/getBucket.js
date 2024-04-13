const { S3Client, ListBucketsCommand } = require("@aws-sdk/client-s3");

// Replace with your AWS credentials
const credentials = {
  region: "ap-northeast-1",
  accessKeyId: "",
  secretAccessKey: "",
};

const s3Client = new S3Client(credentials);

const listBucketsCommand = new ListBucketsCommand({});

s3Client.send(listBucketsCommand)
  .then((data) => {
    const buckets = data.Buckets;
    buckets.forEach((bucket) => {
      console.log("Bucket Name:", bucket.Name);
    });
  })
  .catch((error) => {
    console.error(error);
  });

