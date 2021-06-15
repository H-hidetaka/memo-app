# json.array! インスタンス変数,：キー :title, :description
# jbuilder を使ってjsonを返す
# APIとしてデータを返したいとき、json形式のデータを返すことが多いです。

# Railsには、このjson作成を簡単にしてくれる、jbuilderというものが備わっています。
json.array! @memos, :title, :description
