class Errors::Show < Lucky::ErrorAction
  def handle_error(error : JSON::ParseException)
    if json?
      json({error: "There was a problem parsing the JSON. Please check that it is formed correctly"}, status: 400)
    else
      head status: 400
    end
  end

  def handle_error(error : Exception)
    error.inspect_with_backtrace(STDERR)

    if json?
      json({error: "An unexpected error occured"}, status: 500)
    else
      response.status_code = 500
      render_text "Something went wrong"
    end
  end

  def handle_error(error : LuckyRecord::InvalidFormError)
    message = "Could not save #{error.form.class.name}"
    json_data = {error: message}
    status = 422

    if json?
      json json_data, status: status
    else
      response.status_code = status
      render_text message
    end
  end
end
