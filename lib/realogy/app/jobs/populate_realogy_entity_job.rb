class PopulateRealogyEntityJob < ApplicationJob
  queue_as :default

  def perform(hash)
    hash['class'].constantize::triage(hash)
  end
end
