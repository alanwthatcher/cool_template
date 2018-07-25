# Chef Templates
This repo is all about showcasing some template patterns that can be used to make configurations more delightful.

Recipe|Brief description
------|-----------------
hash_based.rb|Build a template almost entirely with node attribute hashes

# More in depth descriptions
### Hash-based templates
Sometimes, there is a file, such as a configuration file, which is built of some variable number of key / value pairs. Often this template may contain different number of pairs, or perhaps the keys may change based on the specific configuration needs, but other content of the file is not changed. In this case there are a couple of options:
1. Use different templates for each possible combination.
  - Could is perhaps a bit more approachable when first starting out in using templates
  - Can become overbearing when there are many different combinations
  - Is a little infexible if things change, such as a specific combination needs to remove some lines
2. Use a fully dynamic, hash-driven, template
  - The keys and their values are provided as node attributes
  - Only one, or maybe a couple, actual template file(s) are required
  - Max dynamic

This cookbook demonstrates the second option in the recipe `hash_based.erb`, and the associated attributes are contained in the `attributes/default.rb` between the comment tags `### HASH BASED ###` and `### \hash based ###`

The attributes are broken up into application groups, and the application group being used is also defined. In reality, the application type might be a role (or role cookbook) based node attribute. But the important part is that it identifies the hash that the template will use. Change the `default['cool_template']['my_app']` attribute value to see the dynamicism that can be accomplished with this pattern.

How to run just hash-based example:
- `kitchen converge HashBased`
- modify the related attributes and rerun `kitchen converge HashBased` to see changes
