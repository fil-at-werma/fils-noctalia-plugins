--!nonstrict

local function parseTasks(content)
    local pending, completed = {}, {}
    for line in content:gmatch("[^\n]+") do
        if line:match("^%s*$") then
        elseif line:match("^----$") then
            break
        elseif line:match("^x") then
            table.insert(completed, line:sub(3):match("^%s*(.*)$"))
        else
            local num = line:match("^%s*(%d+)")
            local text = line:match("^%s*%d+%s*(.*)$") or line
            table.insert(pending, { number = num, text = text })
        end
    end
    return pending, completed
end

local completeTask

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
            local display = task.text:match("^%a%*%s*(.*)$") or task.text
            table.insert(children, ui.row({ gap = 8 }, {
                ui.label({ text = "  • " .. display, flexGrow = 1 }),
                ui.button({
                    text = "✓",
                    variant = "ghost",
                    onClick = function()
                        completeTask(task.number)
                    end,
                }),
            }))
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

    panel.render(ui.column({}, children))
end

local function refresh()
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

completeTask = function(taskNumber)
    noctalia.runAsync("todo.sh do " .. taskNumber, function(result)
        if result.exitCode == 0 then
            refresh()
        else
            noctalia.notify("Todo", "Failed: " .. (result.stderr or "unknown error"))
        end
    end)
end

function onOpen()
    -- Show loading state immediately
    panel.render(ui.column({}, {
        ui.label({ text = "Loading…" }),
    }))
    refresh()
end   
