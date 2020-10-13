# Rails::API

## Run:

- bundle install
- rails db:migrate
- rails s

## API:

- /api/v1/publisher/:publisher_id

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

- /api/v1/shops/:shop_id

#### Show list of books in related shop(:shop_id) and shows books

### status: "sold_out" || "in_stock"

```
{
"shop": [
           {
                "id": 1,
                "books": [
                    {
                        "id": 1,
                        "title": "1984",
                        "status": "sold_out"
                    },
                    {
                        "id": 2,
                        "title": "Harry Potter",
                        "status": "in_stock"
                    }
                ]
            }
        ]
}
```
