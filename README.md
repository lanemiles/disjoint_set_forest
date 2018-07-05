# DisjointSetForest

This is a very basic implementation of the Disjoint Set Forest (or Union Find) data structure. It is used to keep track of one or more disjoint sets, allowing the user to create a new set with an element (`make_set`), determine which set an element is in (`find`), and merge two sets together (`union`).

This implementation uses `path compression` and `union by rank` to achieve optimal complexity for its operations. To understand their improvements, it is sufficient to know that every element in a disjoint set forest has a parent pointer and a rank value, and the root element of a set (whose parent pointer points to itself) is the "set representative".

The `find` operation is responsible for returning the set representative for a given element. Thus, it must traverse up the set's tree using the parent pointers until it reaches the set representative. Path compression, which is implemented in the `find` method, reduces the height of the tree as it traverses up it for a given element, by recursively setting the parent element of each element it sees along the path to the set representative.

The `union` operation is responsible for merging to disjoint sets together. In its most basic form, this operation must set the parent of one set's set representative to an element in the other set, "merging" the two trees. Union by rank, which is implemented in the `union` operation, is based two observations: 1) it is always best to attach one set to the root of the other set, and 2) it is always best to attach the smaller tree to the root of the larger tree. The rank value of an element begins at 0 and only increments when that element is both set representative and merged with a set of an equal rank.

When combined, path compression and union by rank lead to an asymptotic complexity of O(1) for `make_set` and `O(α(n))` for `find` and thus also `union`, where `α(n)` is the "inverse Ackermann" function. `α(n)` grows very slowly, such that "`α(n)` is less than 5 for any practical input size n."

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'disjoint_set_forest'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install disjoint_set_forest

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).