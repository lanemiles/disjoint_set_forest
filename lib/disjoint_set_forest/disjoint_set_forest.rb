module DisjointSetForest
  class DisjointSetForest

    def initialize
      @parent = {}
      @rank = {}
    end

    def make_set(x)
      @parent[x] = x
      @rank[x] = 0
    end

    def find(x)
      if @parent[x] != x
        @parent[x] = self.find(@parent[x])
      end
      @parent[x]
    end

    def union(x, y)

      x_root = self.find(x)
      y_root = self.find(y)

      return if x_root == y_root

      if @rank[x_root] == @rank[y_root]
        @parent[y_root] = @parent[x_root]
        @rank[x_root] += 1
      elsif @rank[x_root] > @rank[y_root]
        @parent[y_root] = @parent[x_root]
      else
        @parent[x_root] = @parent[y_root]
        @rank[y_root] += 1
      end

    end 

  end
end