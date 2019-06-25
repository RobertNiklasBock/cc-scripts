local base = "https://raw.githubusercontent.com/RobertNiklasBock/cc-scripts/master/"

function wget(file)
    shell.run("wget " .. base .. file .. " " .. file)
end


function main()
    shell.run("rm install.txt")
    wget("install.txt")
    local file = io.open("install.txt")

    for line in io.lines(file) do
        shell.run("rm " .. line)
        print("Getting " .. line)
        wget(line)
    end
end

main()