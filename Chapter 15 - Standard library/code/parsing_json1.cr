class Bstrap::AppJSON
  class InvalidAppJSON < Exception
  end

  def parse_app_json_env(path : String)
    raw_json = File.read(path)

    if app_json = JSON.parse(raw_json).as_h?
      app_json
    else
      raise InvalidAppJSON.new("app.json was file not an object")
    end
  rescue JSON::ParseException
    raise InvalidAppJSON.new("app.json was not valid JSON")
  end
end
