# 루비로 제작한 자판기 프로그램
# @Author : 선문대학교 컴퓨터공학과 김은지
# @Version : 1.0
# @Date : 2018.10.15

#-------------------------------------------------------------------------------
#변수
input_coin = 0 #넣은금액
coin = 0 #총 금액
change = 0 #잔돈
menu = 0 #메뉴선택
v_choice = 0 #음료선택
sales = 0 #총 매출액
add_invenMenu = 0 #수량 추가 메뉴

cola_price = 120 #콜라가격
water_price = 100 #생수가격
redbull_price = 200 #레드불가격
cola_name = "콜라" #콜라이름
water_name = "생수" #생수이름
redbull_name = "레드불" #레드불이름
cola_inventory = 5 #콜라수량 default:5
water_inventory = 5 #생수수량 default:5
redbull_inventory = 5 #레드불수량 default:5
cola_count = 0 #판매한 콜라 개수
water_count = 0 #판매한 생수 개수
redbull_count = 0 #판매한 레드불 개수
cola_add = 0 #콜라 수량 추가
water_add = 0 #생수 수량 추가
redbull_add = 0 #레드불 수량 추가

m1 = 0 # 1엔
m10 = 0 # 10엔
m100 = 0 # 100엔
m500 = 0 # 500엔
m1000 = 0 # 1000엔
#-------------------------------------------------------------------------------

while true
  puts "원하는 메뉴를 골라주세요."
  puts "1.돈 투입 | 2.음료구매 | 3.환불 | 4.매상금액확인 | 5.음료수량추가"
  print ">> "
  menu = gets.chomp.to_i
  if menu == 1
    print "돈을 넣어주세요.(1, 10, 100, 500, 1000엔만 투입이 가능합니다.) : "
    input_coin = gets.chomp.to_i
    if input_coin==1 or input_coin==10 or input_coin==100 or input_coin==500 or input_coin==1000
      coin += input_coin
      # puts "코인#{coin}"
      puts
    else
      puts "다룰 수 없는 돈입니다."
      change += input_coin
      # puts "코인#{coin}"
      puts
    end
  elsif menu == 2
    print "1. #{cola_name}(#{cola_price}엔)수량:#{cola_inventory} | 2.#{water_name}(#{water_price}엔)수량:#{water_inventory} | 3.#{redbull_name}(#{redbull_price}엔)수량:#{redbull_inventory} >> "
    v_choice = gets.chomp.to_i
    if v_choice == 1 and coin >= cola_price and cola_inventory > 0
        coin -= cola_price
        cola_inventory = cola_inventory - 1
        cola_count = cola_count + 1
        puts "뽑은 음료는 #{cola_name}입니다."
        puts "현재잔액 : #{coin}"
    elsif v_choice == 2 and coin >= water_price and water_inventory > 0
        coin -= water_price
        water_inventory = water_inventory - 1
        water_count = water_count + 1
        puts "뽑은 음료는 #{water_name}입니다."
        puts "현재잔액 : #{coin}"
        # puts "생수카운트 : #{water_count}"
    elsif v_choice == 3 and coin >= redbull_price and redbull_inventory > 0
        coin -= redbull_price
        redbull_inventory = redbull_inventory - 1
        redbull_count = redbull_count + 1
        puts "뽑은 음료는 #{redbull_name}입니다."
        puts "현재잔액 : #{coin}"
    else
        change = coin
        cola_inventory = cola_inventory
        water_inventory = water_inventory
        redbull_inventory = redbull_inventory
        puts "선택된 물품의 수량 혹은 잔액이 부족합니다."
        puts "현재잔액과 수량을 확인해주세요."
        puts "현재잔액 : #{coin}"
        puts "콜라수량 : #{cola_inventory}"
        puts "생수수량 : #{water_inventory}"
        puts "레드불수량 : #{redbull_inventory}"
    end #menu3 else end
    puts
  elsif menu == 3
    change = coin
    m1000 = change/1000
    m500 = change%1000/500
    m100 = change%1000%500/100
    m10 = change%1000%500%100/10
    m1 = change%1000%500%100%10/1
    print "1000엔 : #{m1000}개, "
    print "500엔 : #{m500}개, "
    print "100엔 : #{m100}개, "
    print "10엔 : #{m10}개, "
    puts "1엔 : #{m1}개"
    puts "잔돈은 #{change}엔 입니다."
    puts "프로그램이 종료됩니다."
    break
  elsif menu == 4
    sales = cola_count * cola_price
    sales = sales + water_count * water_price
    sales = sales + redbull_count * redbull_price
    puts "총 매출액은 #{sales}엔 입니다."
    puts
  elsif menu == 5
    puts "물품 추가를 원하는 음료를 선택해주세요."
    print "1.콜라 2.생수 3.레드불 >> "
    add_invenMenu = gets.chomp.to_i
    if add_invenMenu == 1
      print "추가하려는 개수를 입력해주세요 : "
      cola_add = gets.chomp.to_i
      if cola_add >= 0
        cola_inventory += cola_add
        puts "콜라수량:#{cola_inventory}"
        puts
      else
        cola_inventory += 0
        puts
      end
    elsif add_invenMenu == 2
      print "추가하려는 개수를 입력해주세요 : "
      water_add = gets.chomp.to_i
      if water_add >= 0
        water_inventory += water_add
        puts "생수수량:#{water_inventory}"
        puts
      else
        water_inventory += 0
        puts
      end
    elsif add_invenMenu == 3
      print "추가하려는 개수를 입력해주세요 : "
      redbull_add = gets.chomp.to_i
      if redbull_add >= 0
        redbull_inventory += redbull_add
        puts "레드불수량:#{redbull_inventory}"
        puts
      else
        redbull_inventory += 0
        puts
      end
    end #add_invenMenu if end
  else
    puts "메뉴에 없는 행동입니다."
    puts
  end # menu if end
end #while end
