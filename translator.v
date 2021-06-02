module translator

import net.http
import net.urllib

// translate_x_to_y create a ContextTranslator with src_lng & dest_lng & text
// and return translated string if the translation update the ContextTranslator.dest_text,
// else return an empty string
pub fn translate_text(src_lng string, dest_lng string, text string) string {
	src_language := supported_language('mymemory', src_lng)
	dest_language := supported_language('mymemory', dest_lng)
	if src_language == '' || dest_language == '' {
		return ''
	}
	mut context := ContextTranslator{
		src_language: src_language
		dest_language: dest_language
		src_text: text
	}
	mut is_ok := context.mymemory_translate()
	if is_ok == 0 {
		return context.dest_text
	}
	is_ok = context.google_translate()
	if is_ok == 0 {
		return context.dest_text
	} else {
		return ''
	}
}

// translate_word use linguee and get the first result, return this result
// else, try to using mymemory to translate, then google, and result an
// empty string if can't get any response
// https://www.linguee.com/{source}-{target}/translation/{word}.html
pub fn translate_word(src_lng string, dest_lng string, word string) string {
	if word.split_into_lines().len != 1 {
		return translate_text(src_lng, dest_lng, word) // word is a sentence(s)
	}
	src_language := supported_language('linguee', src_lng)
	dest_language := supported_language('linguee', dest_lng)
	if src_language == '' || dest_language == '' {
		return ''
	}
	final_url := linguee_api_url[0] + src_language + linguee_api_url[1] + dest_language +
		linguee_api_url[2] + urllib.query_escape(word) + linguee_api_url[3]
	mut text := http.get_text(final_url)
	if text == '' {
		return ''
	}
	start_i := text.index("class='tag_trans'") or { -1 }
	if start_i == -1 {
		return translate_text(src_lng, dest_lng, word)
	}
	mut start := 5 + text.index_after("lid='", start_i)
	mut end := text.index_after("'>", start)
	text = text[start..end]
	start = 1 + text.index(':') or { -1 }
	if start == -1 {
		return translate_text(src_lng, dest_lng, word)
	}
	end = text.index('#') or { -1 }
	if end == -1 {
		return translate_text(src_lng, dest_lng, word)
	}
	final_text := text[start..end]
	if final_text == '' {
		return translate_text(src_lng, dest_lng, word)
	}
	return final_text
}
