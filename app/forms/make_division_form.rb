class MakeDivisionForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :description, :string
  attr_accessor :tag_ids

  def initialize(team, params = {}, division:'')
    @division ||= Division.new
    @division.assign_attributes({team: team, name: params[:name], description: params[:description]})
    super(params)
  end

  def to_model
    @division
  end

  def save!
    binding.pry
    @division.save!

    tag_ids.each do |t|
      @division.divisions_tags.create(tag_id: t.to_i)
    end
  end
end