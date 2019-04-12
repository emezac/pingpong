class History < ApplicationRecord
  belongs_to :player

  validates :name, :chronic, :status, :score, :award, :oponent, :player, presence: true
 
  enum status: %i( winner loss due )
 
  def self.search(query, player_id)
    q = "%#{query}%"
    status = status_number(query)
 
    where(player_id: player_id).
    where('chronic LIKE :query OR
           name LIKE :query OR
           score LIKE :query OR
           award LIKE :query OR
           status = :status',
           query: q, status: status)
  end
 
  def self.status_number(name)
    q = name.parameterize('_')
    statuses[q] if statuses.keys.include?(q)
  end

  def self.statuses_json
    statuses.map do |k, v|
      {
        id: v,
        name: k
      }
    end
  end


end
