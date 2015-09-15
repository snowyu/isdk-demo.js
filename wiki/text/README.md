---
dest:
  <: './text/'
src:
  - '**/*.txt'
  - '**/'
test: '${dest}'
---

this folder process the "*.txt" file only.