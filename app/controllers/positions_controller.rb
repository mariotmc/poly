class PositionsController < ApplicationController
  # all declarations can be made on top level with before_action(?)

  def position_up
    id = params[:id]
    type = params[:type]

    type == "source" ? element = Source.find(id) : element = Partner.find(id)

    # move element one up (visually up, position number down in record)
    # array.insert(2, array.delete_at(7)) (???)
    # https://stackoverflow.com/questions/4733925/how-to-change-the-position-of-an-array-element
  end
  
  def position_down
    id = params[:id]
    type = params[:type]
    
    type == "source" ? element = Source.find(id) : element = Partner.find(id)

    # move element one down (visually down, position number up in record)
  end
end