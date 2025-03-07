from flask import Flask, Response
import json

app = Flask(__name__)


@app.get('/categories')
def get_categories() -> Response:
    categories = [
        {
            "title": "Салаты",
            "image_uri": "/static/images/categories/salad.jpg",
            "background_color": 0xFFB2DFDB
        },
        {
            "title": "Торты",
            "image_uri": "/static/images/categories/salad.jpg",
            "background_color": 0xFFF8BBD0
        },
        {
            "title": "Пироги",
            "image_uri": "/static/images/categories/pie.jpg",
            "background_color": 0xFFD7CCC8
        },
        {
            "title": "Смузи",
            "image_uri": "/static/images/categories/smoothie.jpg",
            "background_color": 0xFFFFCDD2
        },
    ]

    return Response(
        response=json.dumps(categories, ensure_ascii=False),
        content_type="application/json; charset=utf-8"
    )


@app.get('/diets/recommended')
def get_recommended_diets() -> Response:
    diets = [
        {
            "name": "Медовые блиночки",
            "image_uri": "/static/images/diets/honey-pancake.jpg",
            "level": "Легкий",
            "duration_in_minutes": 30,
            "calories": 180,
            "background_color": 0xFFFFF9C4
        },
        {
            "name": "Канайский хлеб",
            "image_uri": "/static/images/diets/canai-bread.jpg",
            "level": "Легкий",
            "duration_in_minutes": 20,
            "calories": 230,
            "background_color": 0xFFFFECB3
        }
    ]

    return Response(
        response=json.dumps(diets, ensure_ascii=False),
        content_type="application/json; charset=utf-8"
    )


@app.get('/diets/popular')
def get_popular_diets() -> Response:
    diets = [
        {
            "name": "Черничные блиночки",
            "image_uri": "/static/images/diets/blueberry-pancake.jpg",
            "level": "Средний",
            "duration_in_minutes": 30,
            "calories": 230,
            "background_color": 0x00000000
        },
        {
            "name": "Лосось Нигири",
            "image_uri": "/static/images/diets/salmon-nigiri.jpg",
            "level": "Легкий",
            "duration_in_minutes": 20,
            "calories": 120,
            "background_color": 0x00000000
        }
    ]

    return Response(
        response=json.dumps(diets, ensure_ascii=False),
        content_type="application/json; charset=utf-8"
    )


if __name__ == "__main__":
    app.run(port=5000, host="0.0.0.0", debug=True)
