-- Initialize the requests array iterator
counter = 0

request = function()
  -- Get the next requests array element

  -- Increment the counter
  counter = counter + 1

  -- If the counter is longer than the requests array length then reset it
  if counter > 999 then
    counter = 0
  end

  -- Return the request object with the current URL path
  req_uri="/cdf/" .. tostring(counter)
  return wrk.format("GET", req_uri, wrk.headers, wrk.body)
end
