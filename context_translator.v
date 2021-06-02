module translator

import net.http
import net.urllib

// ContextTranslator used for function and the method translate
pub struct ContextTranslator {
pub:
	src_language  string
	dest_language string
	src_text      string
pub mut:
	dest_text string
}

// translate with mymemory. return 0 if ContextTranslator.dest_text is updated,
// else return -1
// https://api.mymemory.translated.net/get?q={text}&langpair={source}|{target}
pub fn (mut c ContextTranslator) mymemory_translate() int {
	src_language := supported_language('mymemory', c.src_language)
	dest_language := supported_language('mymemory', c.dest_language)
	if src_language == '' || dest_language == '' {
		return -1
	}
	final_url := mymemory_api_url[0] + urllib.query_escape(c.src_text) + mymemory_api_url[1] +
		src_language + mymemory_api_url[2] + dest_language
	text := http.get_text(final_url)
	if text == '' {
		return -1
	}
	start := 17 + text.index('translatedText') or { return -1 }
	end := text.index_after('","', start)
	c.dest_text = text[start..end]
	return 0
}

// translate with google. return 0 if ContextTranslator.dest_text is updated,
// else return -1
// 'https://translate.googleapis.com/translate_a/single?client=gtx&sl={source}&tl={target}&dt=t&q={text}'
pub fn (mut c ContextTranslator) google_translate() int {
	src_language := supported_language('google', c.src_language)
	dest_language := supported_language('google', c.dest_language)
	if src_language == '' || dest_language == '' {
		return -1
	}
	final_url := google_api_url[0] + src_language + google_api_url[1] + dest_language +
		google_api_url[2] + urllib.query_escape(c.src_text)
	text := http.get_text(final_url)
	if text == '' {
		return -1
	}
	c.dest_text = text.split('","')[0].trim_left('["')
	return 0
}

// translate one word with linguee. return 0 if ContextTranslator.dest_text is updated,
// else return -1
// https://www.linguee.com/{source}-{target}/translation/{word}.html
pub fn (mut c ContextTranslator) linguee_translate() int {
	text := translate_word(c.src_language, c.dest_language, c.src_text)
	if text == '' {
		return -1
	}
	c.dest_text = text
	return 0
}

/*
Not implemented
 * when use the get method, it will not let the time to the server for translate the text -> download an empty result

// translate with deepl. return 0 if ContextTranslator.dest_text is updated,
// else return -1
pub fn (mut c ContextTranslator) deepl_translate() int {
	final_url := deepl_api_url[0] + c.src_language +
		deepl_api_url[1] + c.dest_language +
		deepl_api_url[2] + urllib.query_escape(c.src_text)
	resp := http.post(final_url, '') or { return -1 }
	text := resp.text
	os.write_file("./salut.html", text) or { return -1 }
	start_i := text.index('target-dummydiv') or { return -1 }
	start := text.index_after('">', start_i)
	end := text.index_after('</div>', start)
	print('$start ; $end')
	final_text := text[start..end].trim_space()
	if final_text == '' {
		return -1
	}
	c.dest_text = final_text
	return 0
}
*/
