# Rubyで作成した自販機プログラム
# @Author : Sunmoon.Univのコンピューター工学科のキムウンジ
# @Version : 1.0
# @Date : 2018.10.15

#-------------------------------------------------------------------------------
#変数
input_coin = 0 #投入金額
coin = 0 #総額
change = 0 #釣り銭
menu = 0 #メニュー選び
v_choice = 0 #飲み物選び
sales = 0 #総売り上げ額
add_invenMenu = 0 #数量追加のメニュ

cola_price = 120 #コーラの価格
water_price = 100 #水の価格
redbull_price = 200 #レッドブルの価格
cola_name = "コーラ" #コーラのネーム
water_name = "水" #水のネーム
redbull_name = "レッドブル" #レッドブルのネーム
cola_inventory = 5 #default:5 コーラの数量
water_inventory = 5 #default:5 水の数量
redbull_inventory = 5 #default:5 レッドブルの数量
cola_count = 0 #売れたコーラの個数
water_count = 0 #売れた水の個数
redbull_count = 0 #売れたレッドブルの個数
cola_add = 0 #コーラの数量追加
water_add = 0 #水の数量追加
redbull_add = 0 #レッドブルの数量追加

m1 = 0 # 1円
m10 = 0 # 10円
m100 = 0 # 100円
m500 = 0 # 500円
m1000 = 0 # 1000円
#-------------------------------------------------------------------------------
while true
  puts "メニューを選らんでください。"
  puts "1.お金投入 | 2.飲料の購買 | 3.払い戻し | 4.総売り上げ額確認 | 5.飲料数量追加"
  print ">> "
  menu = gets.chomp.to_i
  if menu == 1
    print "お金を入れてください。(1, 10, 100, 500, 1000円だけ投入ができます。) : "
    input_coin = gets.chomp.to_i
    if input_coin==1 or input_coin==10 or input_coin==100 or input_coin==500 or input_coin==1000
      coin += input_coin
      # puts "코인#{coin}"
      puts
    else
      puts "使えないお金です。"
      change += input_coin
      # puts "코인#{coin}"
      puts
    end
  elsif menu == 2
    print "1. #{cola_name}(#{cola_price}円)数量:#{cola_inventory}個 | 2.#{water_name}(#{water_price}円)数量:#{water_inventory}個 | 3.#{redbull_name}(#{redbull_price}円)数量:#{redbull_inventory}個 >> "
    v_choice = gets.chomp.to_i
    if v_choice == 1 and coin >= cola_price and cola_inventory > 0
        coin -= cola_price
        cola_inventory = cola_inventory - 1
        cola_count = cola_count + 1
        puts "選んだ飲料は#{cola_name}です。"
        puts "現在の残高 : #{coin}円"
    elsif v_choice == 2 and coin >= water_price and water_inventory > 0
        coin -= water_price
        water_inventory = water_inventory - 1
        water_count = water_count + 1
        puts "選んだ飲料は#{water_name}です。"
        puts "現在の残高 : #{coin}円"
        # puts "생수카운트 : #{water_count}"
    elsif v_choice == 3 and coin >= redbull_price and redbull_inventory > 0
        coin -= redbull_price
        redbull_inventory = redbull_inventory - 1
        redbull_count = redbull_count + 1
        puts "選んだ飲料は#{redbull_name}です。"
        puts "現在の残高 : #{coin}円"
    else
        change = coin
        cola_inventory = cola_inventory
        water_inventory = water_inventory
        redbull_inventory = redbull_inventory
        puts "選んだ飲料の数量または残高が不足です。"
        puts "現在の残高と数量を確認してください。"
        puts "現在の残高 : #{coin}円"
        puts "コーラの数量 : #{cola_inventory}個"
        puts "水の数量 : #{water_inventory}個"
        puts "レッドブルの数量 : #{redbull_inventory}個"
    end #menu3 else end
    puts
  elsif menu == 3
    change = coin
    m1000 = change/1000
    m500 = change%1000/500
    m100 = change%1000%500/100
    m10 = change%1000%500%100/10
    m1 = change%1000%500%100%10/1
    print "1000円 : #{m1000}個, "
    print "500円 : #{m500}個, "
    print "100円 : #{m100}個, "
    print "10円 : #{m10}個, "
    puts "1円 : #{m1}個"
    puts "釣り銭は#{change}円です。"
    puts "プログラムを終了します。"
    break
  elsif menu == 4
    sales = cola_count * cola_price
    sales = sales + water_count * water_price
    sales = sales + redbull_count * redbull_price
    puts "総売り上げ額は#{sales}円です。"
    puts
  elsif menu == 5
    puts ("数量を追加する飲料を選んでください。")
    print "1.#{cola_name} 2.#{water_name} 3.#{redbull_name} >> "
    add_invenMenu = gets.chomp.to_i
    if add_invenMenu == 1
      print "追加する個数を入力してください。 : "
      cola_add = gets.chomp.to_i
      if cola_add >= 0
        cola_inventory += cola_add
        puts "コーラの数量:#{cola_inventory}個"
        puts
      else
        cola_inventory += 0
        puts
      end
    elsif add_invenMenu == 2
      print "追加する個数を入力してください。 : "
      water_add = gets.chomp.to_i
      if water_add >= 0
        water_inventory += water_add
        puts "水の数量:#{water_inventory}個"
        puts
      else
        water_inventory += 0
        puts
      end
    elsif add_invenMenu == 3
      print "追加する個数を入力してください。 : "
      redbull_add = gets.chomp.to_i
      if redbull_add >= 0
        redbull_inventory += redbull_add
        puts "レッドブルの数量:#{redbull_inventory}個"
        puts
      else
        redbull_inventory += 0
        puts
      end
    end #add_invenMenu if end
  else
    puts "応答できません。"
    puts
  end # menu if end
end #while end
