const iterations = 100000

fn inc_array_elem(shared b []int, i int) {
	for _ in 0 .. iterations {
		b[i]++
	}
}

fn test_autolock_array() {
	shared a := &[1, 2, 7, 5]
	t := go inc_array_elem(shared a, 2)
	for _ in 0 .. iterations {
		a[2]++
	}
	t.wait()
	assert a[2] == 2 * iterations + 7
}

fn inc_map_elem(shared b map[string]int, k string) {
	for _ in 0 .. iterations {
		b[k]++
	}
}

fn test_autolock_map() {
	shared m := &{
		'xy':  1
		'qwe': 2
		'asd': 7
		'iop': 5
	}
	t := go inc_map_elem(shared m, 'asd')
	for _ in 0 .. iterations {
		m['asd']++
	}
	t.wait()
	assert m['asd'] == 2 * iterations + 7
}
