module Slug
  extend ActiveSupport::Concern
  included do
    extend FriendlyId
    friendly_id :slug_candidates, use: [:slugged]

    def slug_candidates
      if respond_to? :owner #if this concern is used on a model with an Owner
        base = [ :name, [:owner, :name] ] 
        base += Array.new(6) {|i| [:name, i+1]} #tries name(1-6) before using uuid
        base += Array.new(6) {|i| [:owner, :name, i+1]} #tries owner-name(1-6) before using uuid
      else
        base = [:name]
        base += Array.new(6) {|i| [:name, i+1]} #tries name(1-6) before using uuid
      end
    end

    #removes single quotes / apostrophes
    def normalize_friendly_id(string)
      super(string.gsub("'", ""))
    end

    def should_generate_new_friendly_id?
      name_changed?
    end
  end
end
