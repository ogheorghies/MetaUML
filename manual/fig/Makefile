SRC:=$(wildcard *.mp)
SRC:=$(filter-out mptextmp.mp, $(SRC))
DST:=$(patsubst %.mp,%.1,$(SRC))

%.1: %.mp
	mpost -tex=tex $<

all: $(DST)

clean:
	find -E . -regex '.*[0-9]+' -delete
	find . -name "*.log" -delete
	find . -name "*.mpx" -delete
	find . -name "*.dvi" -delete
	find . -name "*.tex" -delete
	find . -name "*.tmp" -delete
	find . -name "mptextmp.mp" -delete

.PHONY: all clean

