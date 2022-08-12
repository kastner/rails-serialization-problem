Demo of rails serializtion problem
==================================

Running the demo
----------------

Works:

```
BUNDLE_GEMFILE=Gemfile-5.2.6 bundle exec ruby ar_play.rb

-- create_table("comments", {:force=>:cascade})
   -> 0.0049s
-- create_table("posts", {:force=>:cascade})
   -> 0.0004s
100
{:background=>"black", :display=>"large"}
```

Fails:

```
BUNDLE_GEMFILE=Gemfile-5.2.8 bundle exec ruby ar_play.rb

[... huge stack trace ...]
ruby/2.5.8/lib/ruby/2.5.0/psych.rb:313:in `safe_load': unknown keywords: permitted_classes, aliases (ArgumentError)
```
Why is this happening to me?
----------------------------

The fix for [CVE-2022-32224](https://github.com/advisories/GHSA-3hhc-qp5v-9p2j) ends up requiring a newer version of Ruby / Psych.