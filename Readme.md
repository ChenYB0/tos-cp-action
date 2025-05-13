# TOS Bucket File Transfer Action

This action automates the transfer of files to a Tencent Object Storage (TOS) bucket using the `tosutil` command-line tool. It handles authentication, configuration, and file transfer operations seamlessly.

## Inputs

| Input           | Description                                                                 | Required | Default Value       |
|-----------------|-----------------------------------------------------------------------------|----------|---------------------|
| `tos_bucket`    | The name of the TOS bucket where files will be transferred.                 | Yes      | -                   |
| `tos_access_key`| The access key for TOS authentication.                                      | Yes      | -                   |
| `tos_secret_key`| The secret key for TOS authentication.                                      | Yes      | -                   |
| `tos_region`    | The region where the TOS bucket is located. Defaults to "cn-beijing".       | No       | `cn-beijing`        |
| `tos_endpoint`  | The endpoint URL for TOS. Defaults to "tos-cn-beijing.volces.com".          | No       | `tos-cn-beijing.volces.com` |
| `source_dir`    | The source directory containing files to transfer. Defaults to current dir.| No       | Current directory   |
| `dest_dir`      | The destination directory in the TOS bucket. Defaults to root of the bucket.| No       | Root of the bucket  |

## Example Usage

```yaml
steps:
  - name: Transfer files to TOS
    uses: ChenYB0@v1.0 # Replace with the actual action path if published
    with:
      tos_bucket: "your-bucket-name"
      tos_access_key: ${{ secrets.TOS_ACCESS_KEY }}
      tos_secret_key: ${{ secrets.TOS_SECRET_KEY }}
      tos_region: "${{ secrets.TOS_REGION }}"  # Optional
      tos_endpoint: "${{ secrets.TOS_ENDPOINT }}"  # Optional
      source_dir: "./dist"  # Optional
      dest_dir: "releases"  # Optional
```