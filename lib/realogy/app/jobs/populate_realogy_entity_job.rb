class PopulateRealogyEntityJob < ApplicationJob
  queue_as :realogy

  def perform(hash)
    hash['class'].constantize::triage(hash)
  end
end
