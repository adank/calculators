class Advanced::Tool::CapitalCost

  include ActiveAttr::Model

  # What has been/will be total expenditure on capital expenditure (HW) and how long is/was the system expected to last
  # at the time of construction
  attribute :hardware_total, :type => Integer
  attribute :hardware_lifespan, :type => Integer
  # --> fine tune
  # source
  attribute :source
  # pumping facilities
  attribute :pumping_facilities
  # transmission
  attribute :transmission
  # distribution
  attribute :distribution
  # storage
  attribute :storage
  # treatment
  attribute :treatment
  # other
  attribute :other
  # --
  # What has been/will be the total expenditure on capital expenditure (SW)?
  attribute :software_total, :type => Integer
  attribute :software_lifespan, :type => Integer

end
