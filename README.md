# Measure coverage with xccov

(One test fails, though)

```bash
$ xcodebuild -workspace test.examples.xcworkspace -scheme test.examples -derivedDataPath Build/ -destination 'platform=iOS Simulator,OS=11.3,name=iPhone 7' -enableCodeCoverage YES clean build test CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO
```

# Get with JSON

The below commands use `jq` to arrange JSON format.

```bash
# Output: https://gist.github.com/KazuCocoa/40eaa3ac9de5e52c1a3795c49657dd4b
$ xcrun xccov view --json Build/Logs/Test/*.xccovreport | jq .

# Output: https://gist.github.com/KazuCocoa/879554e02934d368f976959d3f8cec4b
$ xcrun xccov view --only-targets --json Build/Logs/Test/*.xccovreport | jq .
```

# Other libraries
- Help to handle xcuitest via Python script
    - https://github.com/google/xctestrunner

