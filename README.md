[![tests](https://github.com/tmeissner/psl_with_ghdl/workflows/tests/badge.svg?branch=master)](https://github.com/tmeissner/psl_with_ghdl/actions?query=workflow%3Atests)

# psl_with_ghdl

A collection of examples of using [PSL](https://en.wikipedia.org/wiki/Property_Specification_Language) for functional and formal verification of VHDL designs with [GHDL](https://github.com/ghdl/ghdl) (and [Yosys](https://github.com/YosysHQ/yosys) / [SymbiYosys](https://github.com/YosysHQ/SymbiYosys)).

This is a project with the purpose to get a current state of PSL implementation in GHDL. It probably will find unsupported PSL features, incorrect implemented features or simple bugs like GHDL crashs.

It is also intended for experiments with PSL when learning the language. You can play around with the examples, as they are pretty simple. You can comment out failing assertions if you want to have a successful proof or simulation if you want. You can change them to see what happens.

It is recommended to use an up-to-date version of GHDL as potential bugs are fixed very quickly. Especially the synthesis feature of GHDL is very new and still beta. You can build GHDL from source or use one of the Docker images which contain also the SymbiYosys toolchain. For example the `ghdl/synth:formal` image from Docker Hub. Beware, the Docker images aren't build every day, so it is possible that tests are failing until the image is updated.

You can use my [Dockerfiles for SymbiYosys & GHDL(-synth)](https://github.com/tmeissner/Dockerfiles) to build the docker image on your own machine. Then you have a Docker image with the latest tool versions.

Have fun!


The next lists will grow during further development

## Supported by GHDL:

### Directives

* assert directive
* cover directive
* assume directive (synthesis)
* restrict directive (synthesis)

### Temporal operators (LTL style)

* always operator
* never operator
* logical implication operator (->)
* next operator
* next[n] operator
* next_a[i to j] operator
* next_e[i to j] operator
* next_event operator
* next_event[n] operator
* next_event_e[i to j] operator
* until operator
* until_ operator
* before operator (GHDL crash with a specific property, see psl_before.vhd)
* eventually! operator (simulation, synthesis produces a GHDL crash, see psl_eventually.vhd)

### Sequential Extended Regular Expressions (SERE style)

* Simple SERE
* Overlapping suffix implication operator (|->)
* Non overlapping suffix implication operator (|=>)
* Consecutive repetition operator ([*], [+], [*n], [*i to j])
* Non consecutive repetition operator ([=n], [=i to j])
* Non consecutive goto repetition operator ([->], [->n], [->i to j])
* Length-matching and operator (&&)
* within operator

## Not yet supported by GHDL:

* forall statement
* Synthesis of strong operator versions

## Under investigation

* before_ operator (Seems that LHS & RHS of operator have to be active at same cycle, see psl_before.vhd)
* next_event_a[i to j] operator

## Further Ressources

* [Wikipedia about PSL](https://en.wikipedia.org/wiki/Property_Specification_Language)
* [Doulos Designer's Guide To PSL](https://www.doulos.com/knowhow/psl/)
* [Project VeriPage PSL Tutorial](http://www.project-veripage.com/psl_tutorial_1.php)
* [1850-2010 - IEEE Standard for PSL](https://standards.ieee.org/standard/1850-2010.html)
