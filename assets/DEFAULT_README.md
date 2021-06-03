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
