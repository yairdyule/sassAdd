-- function def
function GetFiles(mask)
  local files = {} -- table of files
  local tmpfile = '/tmp/stmp.txt' 
  os.execute('ls -l '..mask..'>'..tmpfile)
  local f = io.open(tmpfile)
  if not f then return files end
  local k = 1
  for line in f:lines() do
    files[k] = line
    k = k+1
  end
  f:close()
  return files
end

print(table.concat(GetFiles("./")," \n "))
