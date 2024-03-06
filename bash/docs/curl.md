# CURL

## Options and flags
#### 1. -d, --data <data>: Sends POST data in the request body.
This example sends a POST request with form data containing name and email to the specified API endpoint.
```
curl -d "name=John Doe&email=johndoe@example.com" https://api.example.com/users
```
#### 2. -F, --form <name=content>: Sends form data with a specific name and value
This example uploads a file named myfile.txt using the file field in a multipart form data upload
```
curl -F "file=@myfile.txt" https://upload.example.com/files
```
#### 3. -G, --get: Use the GET request method (default)
```
curl https://www.example.com/  # Fetches a web page using GET
```
#### 4. -H, --header <header>: Sets a custom request header
This example sets an authorization header with an API key for accessing a protected resource
```
curl -H "Authorization: Bearer YOUR_API_KEY" https://api.example.com/data
```
#### 5. -i, --include: Includes the HTTP header in the output

#### 6. -L, --location: Follows redirects (useful for automatically following links)

#### 7. -o, --output <file>: Outputs the response to a file.
```
curl -o index.html https://www.example.com/  # Saves the downloaded page as index.html
```
#### 8. -O, --remote-name: Outputs the response with the suggested filename from the server
#### 9. -s, --silent: Suppresses output except for errors.
#### 10. -u, --user <user:password>: Sets username and password for basic authentication
```
curl -u username:password https://protected.example.com/
```
#### 11. -v, --verbose: Increases verbosity for detailed information about the transfer process
Like any other tools
#### 12. -X, --request <method>: Sets the HTTP request method (e.g., POST, PUT, DELETE)
```
curl -X DELETE https://api.example.com/data/123  # Sends a DELETE request to remove a resource
```
#### 13. -a, --basic: Enables basic authentication (use -u for credentials)
#### 14. -b, --cookie <data|filename>: Reads cookies from a string or file
#### 15. -c, --cookie-jar <filename>: Writes cookies to a file after operation (useful for maintaining session cookies).
#### 16. --digest: Enables HTTP Digest authentication.
#### 17. --negotiate: Enables Negotiate authentication.
#### 18. --ntlm: Enables NTLM authentication.
#### 19. -C, --continue-at <offset>: Resumes an interrupted download from a specific byte offset
```
curl -C 1024 https://largefile.com  # Resumes download from byte 1024 onwards
```
#### 20. -f, --fail: Fails on HTTP errors (exits with a non-zero code)
#### 21. --limit-rate <rate>: Limits the transfer rate (bytes per second) to avoid overwhelming the server
#### 22. --limit-rate <rate>: Limits the transfer rate (bytes per second) to avoid overwhelming the server
```
curl --limit-rate 1024 https://largefile.com  # Limits download speed to 1 KB/s
```
#### 23. -m, --max-time <seconds>: Sets the maximum allowed time for the operation (prevents hanging requests)
```
curl -m 30 https://slowserver.com  # Times out after 30 seconds
```
#### 24. --progress-bar: Displays a progress bar during transfers for visual feedback
#### 25. -g, --glob: Enables filename globbing for uploading multiple files matching a pattern
```
curl -g uploads/*.txt https://upload.example.com/  # Up
```
