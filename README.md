# v translator

v module to translate string or word (uses google, mymemory and linguee)

## example

translate a word
```v
import translator

fn main(){
	english_word := 'hello'
	italian_word := translator.translate_word('en', 'it', english_word)
	println('en : $english_word')
	println('it : $italian_word')
}
```

translate sentence
```v
import translator

fn main(){
	english_text := 'hello world !'
	french_text := translator.translate_text('en', 'fr', english_text)
	println('en : $english_text')
	println('fr : $french_text')
}
```

use the translator.ContextTranslator to choose which online translator you want
```v
import translator

fn main(){
	mut context := translator.ContextTranslator{
		src_language: 'en'
		dest_language: 'fr'
		src_text: 'hello world'
	}
	// using google
	if context.google_translate() != 0 {
		println('the text is not translated')
	}
	else {
		println('$context.src_language : $context.src_text')
		println('$context.dest_language : $context.dest_text')
	}
	// using mymemory
	if context.mymemory_translate() != 0 {
		println('the text is not translated')
	}
	else {
		println('$context.src_language : $context.src_text')
		println('$context.dest_language : $context.dest_text')
	}
	// using linguee
	context = translator.ContextTranslator{
		src_language: 'en'
		dest_language: 'it'
		src_text: 'hello' 		// linguee translate only word
								// if there is more than one word, it will use 
								// internaly another method (mymemory , google)
	}
	if context.linguee_translate() != 0 {
		println('the word is not translated')
	}
	else {
		println('$context.src_language : $context.src_text')
		println('$context.dest_language : $context.dest_text')
	}
}
```

# module 

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

#### Powered by vdoc. Generated on: 3 Jun 2021 17:39:52

# tree

"."
├── "assets"
│   └── "DEFAULT_README.md"
├── "context_translator.v"
├── "language.v"
├── "LICENSE"
├── "Makefile"
├── "README.md"
├── "translator_test.v"
├── "translator.v"
├── "url_endpoint.v"
└── "v.mod"

1 directory, 10 files

