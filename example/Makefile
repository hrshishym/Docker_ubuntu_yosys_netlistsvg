test.svg: test.json
	node ../netlistsvg/bin/netlistsvg.js test.json --skin hier.svg --config config.json -o test.svg

test.json: test.ys  test.v test.sdc
	yosys -l test.yslog -q test.ys

clean:
	rm -f test.yslog test.json test.svg

