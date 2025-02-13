module builtin

pub fn (b byte) is_space() bool {
	mut result := false
	#result.val = /^\s*$/.test(String.fromCharCode(b))

	return result
}

pub fn (c byte) is_letter() bool {
	result := false

	#result.val = (c.val >= `a`.charCodeAt() && c.val <= `z`.charCodeAt()) || (c.val >= `A`.charCodeAt() && c.val <= `Z`.charCodeAt())

	return result
}

pub fn (c byte) str() string {
	res := ''
	#res.str = c.val.toString()

	return res
}
