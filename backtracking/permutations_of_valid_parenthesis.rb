def get_all_permuatations(all_perms, open_count, close_count)
  # successfull base case on the edge node
  if close_count == 0
    print all_perms
    puts ""
    return
  end

  # branch
  if open_count != 0
    get_all_permuatations(all_perms + "(", open_count - 1, close_count)
  end

  if close_count > open_count
    get_all_permuatations(all_perms + ")", open_count, close_count - 1)
  end
end

get_all_permuatations("", 3,3)
