
## files

#### the-client

This is a Rails implementation of the backend and the frontend.

#### tools

Process the data files (not in the repo) and outputs JSON (in the repo) ready to be used by the backend.

Usage example: `./tools/bin/gen-estimates-file`

The output will be located at these two locations:

 - the-client/db/pop-estimates-by-zip.json/
 - the-api/lib/pop-estimates-by-zip.js

#### the-api

This a Node implementation of the API only. I wrote this part first, but then I didn't use it...

## development

```
cd the-client
rails server
# visit
# http://localhost:3000
```
