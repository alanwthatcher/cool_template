# Chef Templates
This repo is all about showcasing some template patterns that can be used to make configurations more delightful.

Recipe|Brief description
------|-----------------
all_examples.rb|This will run through all examples found below (useful to spin up one kitchen node to see all things)
hash_based.rb|Build a template almost entirely with node attribute hashes
partials.rb|Build a file by calling other templates within the source template

# More in depth descriptions
### Hash-based templates
Sometimes, there is a file, such as a configuration file, which is built of some variable number of key / value pairs. Often this template may contain different number of pairs, or perhaps the keys may change based on the specific configuration needs, but other content of the file is not changed. In this case there are a couple of options:
1. Use different templates for each possible combination.
  - Is perhaps a bit more approachable when first starting out in using templates
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

Of course, the complexity of the actual hash and/or number of differnet hashes passed in will probably change, based on your specific usage. This is just meant as a quick example of a very dynmamic template. For example, you could replace the `app1/app2/app3` hash keys with something like `ssh` and provide a set of reasonable sshd configuration items, and more specific wrapper cookbooks would then be able to modify, add to, and maybe remove (by setting has values to null, possibly) values that make more sense for a specific use case.

### Partials
Templates can be made up of other templates by calling the `render` method and specifying the necessary options. The Chef docs section on this can be found [here](https://docs.chef.io/templates.html#partial-templates). This can be a useful option in some circumstances where a file may be fairly large, and perhaps different sections are managed by different function teams. Generally, this isn't much of an issue, however humans do sometimes benefit from separation of things into logical groupings which match thier workflows. Also, you can specify the cookbook from which the partial template comes from, so another usage my possibly be to manage a single files contents while separating the sectiosn out into other cookbooks even. And of course, the partial template can be located on the nodes filesystem, so certain edge cases could make use of that functionality as well.

For the purposes of this examples cookbooks, there are two `template` resources that will utilize partials. The first example will just use three partials which have Lorem Ipsum text. The second template will also use three partials, however, the first and last are Lorem Ipsum static text, and the middle text is from the `hash_based` example.

How to run just hash-based example:
- `kitchen converge Partials`
- modify the hash-based related attributes and rerun `kitchen converge Partials` to see changes in the second example
