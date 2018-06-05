module LoadInformationConcern extend ActiveSupport::Concern

  def load_states
    states_without_other = State.except_other.order_by_name
    states_only_other = State.only_other
    @states = states_only_other + states_without_other
  end

  def load_organizations
    @organizations = Organization.active.order_by_name
  end

  def load_categories
    @categories = Category.active.order_by_name
  end

  def load_speakers
    @celebrities = Celebrity.active.order_by_name
  end

  def load_fee_ranges
    @fee_ranges = Celebrity::FEE_RANGES
  end

  def load_services
    @services= Service.except_other.active.order_by_name  
  end

end
