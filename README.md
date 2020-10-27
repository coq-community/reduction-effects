# Reduction Effects

[![CircleCI][circleci-shield]][circleci-link]
[![Contributing][contributing-shield]][contributing-link]
[![Code of Conduct][conduct-shield]][conduct-link]
[![Zulip][zulip-shield]][zulip-link]

[circleci-shield]: https://circleci.com/gh/coq-community/reduction-effects.svg?style=svg
[circleci-link]:   https://circleci.com/gh/coq-community/reduction-effects

[contributing-shield]: https://img.shields.io/badge/contributions-welcome-%23f7931e.svg
[contributing-link]: https://github.com/coq-community/manifesto/blob/master/CONTRIBUTING.md

[conduct-shield]: https://img.shields.io/badge/%E2%9D%A4-code%20of%20conduct-%23f15a24.svg
[conduct-link]: https://github.com/coq-community/manifesto/blob/master/CODE_OF_CONDUCT.md

[zulip-shield]: https://img.shields.io/badge/chat-on%20zulip-%23c1272d.svg
[zulip-link]: https://coq.zulipchat.com/#narrow/stream/237663-coq-community-devs.20.26.20users





## Meta

- Author(s):
  - Hugo Herbelin (initial)
- Coq-community maintainer(s):
  - Yishuai Li ([**@liyishuai**](https://github.com/liyishuai))
  - Jason Gross ([**@JasonGross**](https://github.com/JasonGross))
- License: [Mozilla Public License 2.0](LICENSE)
- Compatible Coq versions: Coq 8.10 or later
- Additional dependencies: none
- Coq namespace: `ReductionEffect`
- Related publication(s): none

## Building and installation instructions

The easiest way to install the latest released version of Reduction Effects
is via [OPAM](https://opam.ocaml.org/doc/Install.html):

```shell
opam repo add coq-released https://coq.inria.fr/opam/released
opam install coq-reduction-effects
```

To instead build and install manually, do:

``` shell
git clone https://github.com/coq-community/reduction-effects.git
cd reduction-effects
make   # or make -j <number-of-cores-on-your-machine>
make install
```



