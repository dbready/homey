# Bash

## Delete temporary directory at end of script

```bash
# create temp dir
TEMP_DIR=$(mktemp -d)

# define cleanup function
function cleanup {      
  rm -rf "${TEMP_DIR}"
}

# register the cleanup function on EXIT signal
trap cleanup EXIT

# run command
```
