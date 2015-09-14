---
cwd: ./wiki   # change the current working directory to process.
dest: ./output # change the dest directory to output.
tasks:
  - mkdir
  - echo
  - template
  - copy
src:
  - "**/*.md"
  - "**/"
  - "!**/node_modules" #ignore node_modules
  - "!**/.*" #ignore .*
  - "!./output" #ignore the output dir.
logger:
  level: debug
---

## ISDK Demo

This demos the isdk building concert and how to process the folder.
It's just a beginning. Many things need to implement.

This `README.md` file is the root configuration file of the folder.
The configuration is the [front-matter][front-matter] at top of the file.

this demo will process the mardown files("*.md") in the `wiki` folder,
use the default template engine - [lodash](https://lodash.com/docs#template).
And copy the markdown files to the `output` folder.

first you should download this demo and install dependency packages:

```bash
git clone git@github.com:snowyu/isdk-demo.js.git isdk-demo
cd isdk-demo/
npm install
```

At last run the magic in the `isdk-demo` folder:

    npm run build


### Configuration items

* dest *(String)*: The destination directory to output(optional).
  defaults to "./public".
* cwd *(String)*: The current working directory to process(optional).
  defaults to '.'
* src *(String|Array String)*: The source file filter.
  * The first letter "!" indicates a mismatch.
    * Note: The order is important, if the first one is not match, then the latter match all are failed.
  * `"**"` Indicates match any subdirectory
* tasks: the task list to execute，task list according to the order they appear, one by one. Only for the files(not directories).
* logger: the configuraion options of the logger
  * level: the logging level, defaults to 'error'


## License

MIT

[front-matter]: http://jekyllrb.com/docs/frontmatter/
