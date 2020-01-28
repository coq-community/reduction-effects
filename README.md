# Reduction Effects

[![CircleCI][circleci-shield]][circleci-link]
[![Contributing][contributing-shield]][contributing-link]
[![Code of Conduct][conduct-shield]][conduct-link]
[![Gitter][gitter-shield]][gitter-link]

[circleci-shield]: https://circleci.com/gh/coq-community/reduction-effects.svg?style=svg
[circleci-link]:   https://circleci.com/gh/coq-community/reduction-effects

[contributing-shield]: https://img.shields.io/badge/contributions-welcome-%23f7931e.svg
[contributing-link]: https://github.com/coq-community/manifesto/blob/master/CONTRIBUTING.md

[conduct-shield]: https://img.shields.io/badge/%E2%9D%A4-code%20of%20conduct-%23f15a24.svg
[conduct-link]: https://github.com/coq-community/manifesto/blob/master/CODE_OF_CONDUCT.md

[gitter-shield]: https://img.shields.io/badge/chat-on%20gitter-%23c1272d.svg
[gitter-link]: https://gitter.im/coq-community/Lobby





## Meta

- Author(s):
  - Hugo Herbelin (initial)
- Coq-community maintainer(s):
  - Yishuai Li ([**@liyishuai**](https://github.com/liyishuai))
  - Jason Gross ([**@JasonGross**](https://github.com/JasonGross))
- License: [GNU Lesser General Public License v2.1](LICENSE)
- Compatible Coq versions: Coq 8.10
- Compatible OCaml versions: all versions supported by Coq
- Additional Coq dependencies: none

## Building and installation instructions

The easiest way to install the latest released version of Reduction Effects
is via [OPAM](https://opam.ocaml.org/doc/Install.html):

```shell
opam repo add coq-released https://coq.inria.fr/opam/released
opam install coq-reduction-effects
```

To instead build and install manually, do:

``` shell
git clone https://github.com/coq-community/reduction-effects
cd reduction-effects
make   # or make -j <number-of-cores-on-your-machine>
make install
```

After installation, the included modules are available under
the `ReductionEffect` namespace.
