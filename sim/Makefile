include tests.mk

VHD_STD := 08

.PHONY: all clean

.SECONDARY:


all: ${psl_tests}

%: ../src/%.vhd ../src/pkg.vhd ../src/sequencer.vhd ../src/hex_sequencer.vhd tb_tops/%/testbench.vhd
	nvc --std=$(VHD_STD) --work=lib_$@ -a  ../src/pkg.vhd ../src/sequencer.vhd ../src/hex_sequencer.vhd
	nvc --std=$(VHD_STD) --work=lib_$@ -a --psl ../src/$@.vhd
	nvc --std=$(VHD_STD) --work=lib_$@ -a tb_tops/$@/testbench.vhd
	nvc --std=$(VHD_STD) --work=lib_$@ -e tb_$@
	nvc --std=$(VHD_STD) --work=lib_$@ -r tb_$@ --wave=$@

tb_tops/%/testbench.vhd: template.vhd
	mkdir -p tb_tops;
	mkdir -p $(dir $@)
	sed 's/__DUT__/$(subst /,,$(subst tb_tops,,$(dir $@)))/g' $< > $@

clean:
	rm -rf tb_tops
	rm -rf work
