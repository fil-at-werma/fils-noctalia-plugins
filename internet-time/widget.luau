local function getBeats()
    -- Get current time as Unix epoch seconds
    local now = os.time()

    -- Seconds since UTC midnight
    local utcMidnight = now - (now % 86400)
    local utcSeconds = now - utcMidnight

    -- Convert to Biel Mean Time (UTC+1)
    local bmtSeconds = (utcSeconds + 3600) % 86400

    -- 1 beat = 86.4 seconds
    local beats = math.floor(bmtSeconds / 86.4) % 1000

    return string.format("@%03d", beats)
end

function update()
    noctalia.setUpdateInterval(1000)
    barWidget.setGlyph("⏱")
    barWidget.setText(getBeats())
end

function onClick()
    -- Optional: notify with a tooltip-style message
    noctalia.notify("Internet Time", "Current: " .. getBeats())
end   
