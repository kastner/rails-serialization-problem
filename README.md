Demo of rails serializtion problem
==================================

Running the demo
----------------

Works:

```
BUNDLE_GEMFILE=Gemfile-5.2.6 bundle exec ruby ar_play.rb
```

Fails:

```
BUNDLE_GEMFILE=Gemfile-5.2.8 bundle exec ruby ar_play.rb
```

Why is this happening to me?
----------------------------

The fix for [CVE-2022-32224](https://github.com/advisories/GHSA-3hhc-qp5v-9p2j) ends up requiring a newer version of Ruby / Psych.