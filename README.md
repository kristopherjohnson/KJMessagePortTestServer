This is a simple example of using the CFMessagePort to send messages between processes using Swift.

Simple test:

```sh
xcodebuild -alltargets                 # Build server and client
./build/Release/KJMessageTestServer &  # Run the server in the background
./build/Release/KJMessageTestClient    # Run the client and see the output from both processes
```
