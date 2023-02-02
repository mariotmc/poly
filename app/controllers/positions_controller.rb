class PositionsController < ApplicationController
  def position_up
    if type == "source" && match_challenge.sources.exists?(position: element.position-1)
      prev_element = match_challenge.sources.find_by(position: element.position-1)
    elsif type == "partner" && match_challenge.partners.exists?(position: element.position-1)
      prev_element = match_challenge.partners.find_by(position: element.position-1)
    end

    if element.position > 0
      element.update_attribute("position", element.position-1)
      prev_element.update_attribute("position", prev_element.position+1) unless prev_element.nil?
    end

    check_if_correct(element, prev_element)
  end
  
  def position_down
    if type == "source" && match_challenge.sources.exists?(position: element.position+1)
      next_element = match_challenge.sources.find_by(position: element.position+1)
    elsif type == "partner" && match_challenge.partners.exists?(position: element.position+1)
      next_element = match_challenge.partners.find_by(position: element.position+1)
    end

    if type == "source" && element.position < match_challenge.sources.order_by_position.last.position
      element.update_attribute("position", element.position+1)
      next_element.update_attribute("position", next_element.position-1) unless next_element.nil?
    elsif type == "partner" && element.position < match_challenge.partners.order_by_position.last.position
      element.update_attribute("position", element.position+1)
      next_element.update_attribute("position", next_element.position-1) unless next_element.nil?
    end

    check_if_correct(element, next_element)
  end

  def check_submission
    if match_challenge.sources.count == match_challenge.sources.correct.count
      puts "---------------------"
      puts "CORRECT"
      puts "---------------------"
    else
      puts "---------------------"
      puts "WRONG"
      puts "---------------------"
    end
  end

  private
    def id
      params[:id]
    end

    def type
      params[:type]
    end

    def match_challenge
      MatchChallenge.find(params[:match_challenge])
    end

    def element
      type == "source" ? match_challenge.sources.find(id) : match_challenge.partners.find(id)
    end

    def check_if_correct(element, prev_next_element)
      if type == "source"
        if element.position == element.partner.position
          element.update_attribute("correct", true)
        else
          element.update_attribute("correct", false)
        end

        if prev_next_element.position == prev_next_element.partner.position
          prev_next_element.update_attribute("correct", true)
        else
          prev_next_element.update_attribute("correct", false)
        end
      elsif type == "partner"
        if element.position == element.source.position
          element.source.update_attribute("correct", true)
        else
          element.source.update_attribute("correct", false)
        end
        if prev_next_element.position == prev_next_element.source.position
          prev_next_element.source.update_attribute("correct", true)
        else
          prev_next_element.source.update_attribute("correct", false)
        end
      end
    end
end