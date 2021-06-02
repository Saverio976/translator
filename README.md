# v translator

v module to translate string (uses google, mymemory and linguee)

# module translator

## Contents
- [translate_text](#translate_text)
- [translate_word](#translate_word)
- [ContextTranslator](#ContextTranslator)
  - [mymemory_translate](#mymemory_translate)
  - [google_translate](#google_translate)
  - [linguee_translate](#linguee_translate)

## translate_text
```v
fn translate_text(src_lng string, dest_lng string, text string) string
```
 translate_x_to_y create a ContextTranslator with src_lng & dest_lng & text  and return translated string if the translation update the ContextTranslator.dest_text,  else return an empty string 

[[Return to contents]](#Contents)

## translate_word
```v
fn translate_word(src_lng string, dest_lng string, word string) string
```
 translate_word use linguee and get the first result, return this result  else, try to using mymemory to translate, then google, and result an  empty string if can't get any response  https://www.linguee.com/{source}-{target}/translation/{word}.html 

[[Return to contents]](#Contents)

## ContextTranslator
```v
struct ContextTranslator {
pub:
	src_language  string
	dest_language string
	src_text      string
pub mut:
	dest_text string
}
```
 ContextTranslator used for function and the method translate 

[[Return to contents]](#Contents)

## mymemory_translate
```v
fn (mut c ContextTranslator) mymemory_translate() int
```
 translate with mymemory. return 0 if ContextTranslator.dest_text is updated,  else return -1  https://api.mymemory.translated.net/get?q={text}&langpair={source}|{target} 

[[Return to contents]](#Contents)

## google_translate
```v
fn (mut c ContextTranslator) google_translate() int
```
 translate with google. return 0 if ContextTranslator.dest_text is updated,  else return -1  'https://translate.googleapis.com/translate_a/single?client=gtx&sl={source}&tl={target}&dt=t&q={text}' 

[[Return to contents]](#Contents)

## linguee_translate
```v
fn (mut c ContextTranslator) linguee_translate() int
```
 translate one word with linguee. return 0 if ContextTranslator.dest_text is updated,  else return -1  https://www.linguee.com/{source}-{target}/translation/{word}.html 

[[Return to contents]](#Contents)

#### Powered by vdoc. Generated on: 2 Jun 2021 13:35:42
