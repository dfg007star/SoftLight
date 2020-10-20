# Rails::API

## Run:

- bundle install
- rails db:migrate
- rails s

## API:

- /api/v1/publisher/:publisher_id/shops

#### Show list of shops where related publisher(:publisher_id) book selling

```
{
"shops": [
            {
                "id": 1,
                "name": "Amazon",
                "books_sold_count": 22,
                "books_in_stock": [
                    {
                        "id": 2,
                        "title": "Harry Potter",
                        "copies_in_stock": 78
                    }
                ]
            },
        {}
        ]
    }
```

<br>

- /api/v1/sell_books?shop_id=1&book_id=1&count=2

#### Method sell_books takes params[:shop_id], params[:book_id], params[:count] and return JSON with status.
