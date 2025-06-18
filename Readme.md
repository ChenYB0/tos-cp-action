# TOS Bucket File Transfer Action

This action automates the transfer of files to a volcengine object storage (TOS) bucket using the `tosutil` command-line tool. It handles authentication, configuration, and file transfer operations seamlessly.

## Inputs

| Input           | Description                                                                 | Required | Default Value       |
|-----------------|-----------------------------------------------------------------------------|----------|---------------------|
| `TOS_BUCKET`    | The name of the TOS bucket where files will be transferred.                 | Yes      | -                   |
| `TOS_ACCESS_KEY`| The access key for TOS authentication.                                      | Yes      | -                   |
| `TOS_SECRET_KEY`| The secret key for TOS authentication.                                      | Yes      | -                   |
| `TOS_REGION`    | The region where the TOS bucket is located. Defaults to "cn-beijing".       | No       | `cn-beijing`        |
| `TOS_ENDPOINT`  | The endpoint URL for TOS. Defaults to "tos-cn-beijing.volces.com".          | No       | `tos-cn-beijing.volces.com` |
| `SOURCE_DIR`    | The source directory containing files to transfer. Defaults to current dir.| No       | Current directory   |
| `DEST_DIR`      | The destination directory in the TOS bucket. Defaults to root of the bucket.| No       | Root of the bucket  |

## Example Usage

```yaml
steps:
  - name: Transfer files to TOS
    uses: ChenYB0/tos-cp-action@main # Replace with the actual action path if published
    env:
      TOS_BUCKET: "your-bucket-name"
      TOS_ACCESS_KEY: ${{ secrets.TOS_ACCESS_KEY }}
      TOS_SECRET_KEY: ${{ secrets.TOS_SECRET_KEY }}
      TOS_REGION: "${{ secrets.TOS_REGION }}"  # Optional
      TOS_ENDPOINT: "${{ secrets.TOS_ENDPOINT }}"  # Optional
      SOURCE_DIR: "./dist"  # Optional
      DEST_DIR: "releases"  # Optional
```
