--!nonstrict

local TODO_PATH = noctalia.getConfig("todo_path") or "~/OneDrive/todo/todo.txt"

local function parsePending(content)
    local pending = {}
    for line in content:gmatch("[^\n]+") do
        if line:match("^%s*$") then
            -- skip empty/whitespace-only lines
        elseif line:match("^x%s") then
            -- skip completed
        else
            table.insert(pending, line)
        end
    end
    return pending
end

function update()
    noctalia.setUpdateInterval(5000) -- refresh every 5s

    local content, err = noctalia.readFile(TODO_PATH)
    if not content then
        barWidget.setGlyph("⚠")
        barWidget.setText("todo: ?")
        return
    end

    local pending = parsePending(content)
    local count = #pending

    barWidget.setGlyph("checklist")
    -- barWidget.setGlyph("☑")
    if count == 0 then
        barWidget.setText("done")
    else
        barWidget.setText(tostring(count) .. " tasks")
    end
end

function onClick()
    noctalia.togglePanel("fil-at-werma/noc-todo:list")
end   
