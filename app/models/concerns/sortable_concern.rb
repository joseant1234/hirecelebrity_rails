module SortableConcern extend ActiveSupport::Concern
  module ClassMethods

    def order_by_random
      # RANDOM() function only work with PG, with mysql is the RAND() function
      order("RANDOM()")
    end

    def order_by_name
      order(name: :asc)
    end

    def order_by_last_name
      order(last_name: :asc)
    end

    def order_by_title
      order(title: :asc)
    end

    def lasted
      order(id: :desc)
    end

  end
end
