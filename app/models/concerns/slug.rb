module Slug
  extend ActiveSupport::Concern
  included do
    extend FriendlyId
    friendly_id :slug_candidates, use: [:slugged]

    def slug_candidates
      if respond_to? :owner #if this concern is used on a model with an Owner
        [
          :name,
          [:owner, :name]
        ] + Array.new(6) {|index| [:owner, :name, index+1]} #tries 1-6 before using uuid
      else
        [:name] + Array.new(6) {|index| [:name, index+1]} #tries 1-6 before using uuid
      end
    end

    #removes single quotes / apostrophes
    def normalize_friendly_id(string)
      super(string.gsub("'", ""))
    end 
  end
end