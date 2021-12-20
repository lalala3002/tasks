using HorizonSideRobots
function lesenka(r::Robot)
  stenka(r)
  k = purmarker(r)
  k -= 1
  go_to_markers(r, West)
  move!(r, Nord)
  while k>0 && !isborder(r, Nord)
    string(r, Ost, k)
    go_to_markers(r, West)
    move!(r, Nord)
    k=k-1
  end
  string(r, Ost, k)
end

function stenka(r::Robot, side) #двигает в угол
  while isborder(r, West) == false
    move!(r, West)
  end
  while isborder(r, Sud) == false
    move!(r, Sud)
  end
end

function markers(r::Robot) #передвигает на следующую строчку
  while ismarker!(r)
    move!(r, Nord)
  end
  move!(r, West)
end

function purmarker(r::Robot) #ставит нижние маркеры
  k = 0
  while isborder(r, Ost) == false
    putmarker!(r)
    move!(r, Ost)
    k += 1
  end
  putmarker!(r)
  return k
end

function string(r::Robot, side, k) #ставит маркеры в строчку
  for _ in 1:k
    putmarker!(r)
    move!(r, side)
  end
  putmarker!(r)
end

function go_to_markers(r::Robot, side) #возвращает по маркерам
  while ismarker(r) && !isborder(r, side)
    move!(r, side)
  end
end

