---
cwd: ./wiki     # change the current working directory to process.
dest: ./output/ # change the dest directory to output.
tasks:
  - mkdir
  - echo
  - template
  - copy:
      <: #inherited params
        overwrite: false
  - echo:
      hi: 'this a echo string'
src:
  - "**/*.md"
  - "**/"
  - "!**/node_modules" #ignore node_modules
  - "!**/.*" #ignore .*
  - "!./output" #ignore the output dir.
logger:
  level: debug
overwrite: true
force: false
raiseError: false
---

## ISDK Demo

This file shows the isdk building concept and how to process the folder.
It's just a beginning.

The distinguishing features of the ISDK building are:

* the index file(`README.md`) of a Folder is the folder's configuration.
* the folder(directory) tree is the inheritance tree.
  * the configuration of the file or subdirectory inherits from the parent directory.

This `README.md` file is the root configuration file of the folder.
The configuration is the [front-matter][front-matter] at top of the file.

This demo will process the mardown files("*.md") in the `wiki` folder,
and the text files("*.txt") int the `wiki/text` folder,
use the default template engine - [lodash](https://lodash.com/docs#template).
And copy these files to the `output` folder.

first you should download this demo and install dependency packages:

```bash
git clone git@github.com:snowyu/isdk-demo.js.git isdk-demo
cd isdk-demo/
npm install
```

At last run the magic in the `isdk-demo` folder:

    npm run build

now try again, it will report an error on copy task:

    EEXIST

This means the dest file is already exists.

You can set the `overwrite` option to true to avoid this.

### Configuration items

* `dest` *(String)*: The destination directory to output(optional).
  defaults to "./public".
* `cwd` *(String)*: The current working directory to process(optional).
  defaults to '.', this option only for the root folder of project.
* `src` *(String|Array String)*: The source file filter.
  * The first letter "!" indicates a mismatch.
    * Note: The order is important, if the first one is not match, then the latter match all are failed.
  * `"**"` Indicates match any subdirectory
* `tasks`: the task list to execute，task list according to the order they appear, one by one. Only for the files(not directories).
  * `force` *(Boolean)*: whether force to continue even though some error occur.
    default to false.
  * `raiseError` *(Boolean)*: whether throw error exception.
    default to false.
* `logger`: the configuraion options of the logger
  * level: the logging level, defaults to 'error'
* `overwrite` *(Boolean)*: whether overwrite the already exist files. used via [copy][copy] task.
  default to false.

### tasks

* [mkdir][mkdir] task: Create a new directory and any necessary subdirectories at dest path.
  * dest *(String)*: the new directory to create.
* [echo][echo] task: just echo the input options object argument to the result output.
  * you can test the arguments of a task here.
* [template][template] task: Process the contents of a file via the default template
  engine(the first registered template engine).
  * engine *(String)*: the template engine name(optional).
  * `...`: the specified engine options(optional).
* [copy][copy] task: copy the file to the dest.
  * dest *(String)*: the dest folder or file name.
  * overwrite *(Boolean)*: whether overwrite the dest file if it's exist.
    default to false.


**Note:** The default argument(object) passed to the task is this file object if no
specifed the parameter of the task.

## License

MIT

[front-matter]: http://jekyllrb.com/docs/frontmatter/
[mkdir]: https://github.com/snowyu/task-registry-file-mkdir.js
[echo]: ./src/tasks/echo.coffee
[template]: https://github.com/snowyu/task-registry-file-template.js
[copy]: https://github.com/snowyu/task-registry-file-copy.js