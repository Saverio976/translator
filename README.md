# v translator

v module to translate string (uses https://translate.googleapis.com)

# module translator

## Contents
- [translate_x_to_y](#translate_x_to_y)
- [Context](#Context)
  - [translate](#translate)

## translate_x_to_y
```v
fn translate_x_to_y(src_lng string, dest_lng string, text string) ?Context
```
 translate_x_to_y will create the Context and return it with the dest_text   set if Context.translate returns 0 

[[Return to contents]](#Contents)

## Context
```v
struct Context {
pub:
	src_language  string
	dest_language string
	src_text      string
pub mut:
	dest_text string
}
```


[[Return to contents]](#Contents)

## translate
```v
fn (mut c Context) translate() int
```
 translate will set Context.dest_text and return 0 if all is ok, else it will   juste return -1 

[[Return to contents]](#Contents)

#### Powered by vdoc. Generated on: 31 May 2021 19:46:01
