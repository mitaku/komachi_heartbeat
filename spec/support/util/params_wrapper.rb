module ParamsWrapper
  def params_wrapper(params = {})
    if Gem::Version.new(Rails.version) >= Gem::Version.new("5.0.0")
      { params: params }
    else
      params
    end
  end
end
