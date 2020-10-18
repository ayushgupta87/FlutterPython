from flask import Flask, request
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

items = []


class Item(Resource):
    def get(self, name):
        for item in items:
            if item['name'] == name:
                return item, 200
        return {'message': 'Item not found'}, 404

    def post(self, name):
        data = request.get_json()
        item = {'name': name, 'price': data['price']}
        items.append(item)
        return item, 201

    def delete(self, name):
        global items
        items = list(filter(lambda x: x['name'] != name, items))
        return {'message': 'item deleted'}

    def put(self, name):
        data = request.get_json()
        item = next(filter(lambda x : x['name'] == name, items), None)
        if item is None:
            item = {'name' : name, 'price' : data['price']}
            items.append(item)
        else:
            item.update(data)
        return item


class ItemsList(Resource):
    def get(self):
        return {'items': items}


api.add_resource(Item, '/item/<string:name>')
api.add_resource(ItemsList, '/items')

if __name__ == '__main__':
    app.run(debug=True, port=5000)
