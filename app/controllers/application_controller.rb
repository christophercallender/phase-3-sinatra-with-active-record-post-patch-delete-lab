class ApplicationController < Sinatra::Base
  set default_content_type: "application/json"
  
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end
  
  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.by_price
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    baked_good = BakedGood.by_price.first
    baked_good.to_json
  end

  post '/baked_goods' do
    baked_good = BakedGood.create(params)
    baked_good.to_json
  end

  patch '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.update(params)
    bakery.to_json
  end

  delete '/baked_goods/:id' do
    baked_good = BakedGood.find(params[:id])
    baked_good.destroy
  end
end
