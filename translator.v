module translator

import net.http
import net.urllib

const (
	api_url    = 'https://translate.googleapis.com/translate_a/single?client=gtx&sl='
	api_2_part = '&tl='
	api_3_part = '&dt=t&q='
)

pub struct Context {
pub:
	src_language  string
	dest_language string
	src_text      string
pub mut:
	dest_text string
}

// translate will set Context.dest_text and return 0 if all is ok, else it will
// juste return -1
pub fn (mut c Context) translate() int {
	final_url := api_url + c.src_language + 
		api_2_part + c.dest_language + 
		api_3_part + urllib.query_escape(c.src_text)
	text := http.get_text(final_url)
	if text == '' {
		return -1
	}
	c.dest_text = text.split('","')[0].trim_left('["')
	return 0
}

// translate_x_to_y will create the Context and return it with the dest_text
// already set if Context.translate returns 0
pub fn translate_x_to_y(src_lng string, dest_lng string, text string) ?Context {
	mut context := Context{
		src_language: src_lng
		dest_language: dest_lng
		src_text: text
	}
	is_ok := context.translate()
	return if is_ok == 0 { context } else { none }
}
