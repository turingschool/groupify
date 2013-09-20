module GSchool
  module Group
    def random
      all.shuffle
    end

    def groups(n)
      per = (all.count / n.to_f).ceil
      random.each_slice(per).to_a
    end
  end
end
