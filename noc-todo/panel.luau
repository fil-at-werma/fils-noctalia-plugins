--!nonstrict

local function parseTasks(content)
    local pending, completed = {}, {}
    for line in content:gmatch("[^\n]+") do
        if line:match("^%s*$") then
            -- skip empty
        elseif line:match("^x%") then
            table.insert(completed, line:sub(3):match("^%s*(.*)$"))
        else
            table.insert(pending, line)
        end
    end
    return pending, completed
end

local function render(content)
    local pending, completed = parseTasks(content)

    local children = {}

    -- Header
    table.insert(children, ui.label({ text = "Pending (" .. #pending .. ")", bold = true }))

    -- Pending tasks
    if #pending == 0 then
        table.insert(children, ui.label({ text = "  All clear ✓" }))
    else
        for _, task in ipairs(pending) do
            local display = task:match("^%a%*%s*(.*)$") or task
            table.insert(children, ui.label({ text = "  • " .. display }))
        end
    end

    -- Completed section
    if #completed > 0 then
        table.insert(children, ui.label({ text = "" }))
        table.insert(children, ui.label({ text = "Completed (" .. #completed .. ")", bold = true }))
        for _, task in ipairs(completed) do
            table.insert(children, ui.label({ text = "  ✓ " .. task }))
        end
    end

    panel.render(ui.column({}, {
        ui.scroll({ flexGrow = 1 }, children),
    }))
end

function onOpen()
    -- Show loading state immediately
    panel.render(ui.column({}, {
        ui.label({ text = "Loading…" }),
    }))

    noctalia.runAsync("todo.sh -p", function(result)
        if result.exitCode ~= 0 then
            panel.render(ui.column({}, {
                ui.label({ text = "todo.sh failed (exit " .. result.exitCode .. ")", bold = true }),
                ui.label({ text = result.stderr }),
            }))
            return
        end
        render(result.stdout)
    end)
end   
