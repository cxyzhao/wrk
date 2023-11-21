-- Initialize the requests array iterator

local threadid = 0
local threads = {}

setup = function(thread)
  thread:set("id", threadid)
  table.insert(threads, thread)
  threadid = threadid + 1
end

function init(args)
  if id == 0 then
    counter = 99900
  else
    counter = 3100 * id
  end
end

request = function()
  -- Get the next requests array element



  fnameid = counter
  if counter <= 99099 then
    fnameid = math.floor(counter / 1000)
  elseif counter <= 99909 then
    fnameid = math.floor(counter / 100)
  elseif counter <= 99990 then
    fnameid = math.floor(counter / 10)
  else
    fnameid = counter
  end

  -- Return the request object with the current URL path
  req_uri="/cdf/" .. tostring(fnameid)
  counter = counter + 1
  -- If the counter is longer than the requests array length then reset it
  if counter > 99999 then
    counter = 0
  end
  return wrk.format("GET", req_uri, wrk.headers, wrk.body)
    -- Increment the counter
   
end

function done(summary, latency, requests)
  for index, thread in ipairs(threads) do
    local id        = thread:get("id")
    local counter = thread:get("counter")
  end
end
