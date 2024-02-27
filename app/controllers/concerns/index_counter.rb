module IndexCounter
  private
  def update_index_counter
    if session[:index_counter].nil?
      session[:index_counter] = 1
    else
      session[:index_counter] += 1
    end
    @index_counter = session[:index_counter]
  end

  def reset_index_counter
    unless session[:index_counter].nil?
      session[:index_counter] = 0
    end
  end
end
