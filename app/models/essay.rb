class Essay < ApplicationRecord
  has_many :research_pods, :dependent => :destroy
  has_many :sections, :dependent => :destroy
  has_many :sources, :dependent => :destroy
end
