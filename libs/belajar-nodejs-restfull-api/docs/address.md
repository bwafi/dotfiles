# Address API Spec

## Create Address API

Endpoint : POST /api/contacts/:contactId/addresses

Header :

- Authorization : token

Request Body :

```json
{
  "street": "sudirman",
  "city": "Jember",
  "province": "Jawa Timur",
  "country": "Indonesia",
  "postal_code": "343421"
}
```

Response Body Success :

```json
{
  "data": {
    "id": 1,
    "street": "sudirman",
    "city": "Jember",
    "province": "Jawa Timur",
    "country": "Indonesia",
    "postal_code": "343421"
  }
}
```

Response Body Error :

```json
{
  "errors": "Country is Required"
}
```

## Update Address API

Endpoint : PUT /api/contacts/:contactId/addresses/:addressesId

Header :

- Authorization : token

Request Body :

```json
{
  "id": 1,
  "street": "sudirman",
  "city": "Jember",
  "province": "Jawa Timur",
  "country": "Indonesia",
  "postal_code": "343421"
}
```

Response Body Success :

```json
{
  "data": {
    "id": 1,
    "street": "sudirman",
    "city": "Jember",
    "province": "Jawa Timur",
    "country": "Indonesia",
    "postal_code": "343421"
  }
}
```

Response Body Error :

```json
{
  "errors": "Country is Required"
}
```

## Get Address API

Endpoint : GET /api/contacts/:contactId/addresses/:addressesId

Header :

- Authorization : token

Response Body Success :

```json
{
  "data": {
    "id": 1,
    "street": "sudirman",
    "city": "Jember",
    "province": "Jawa Timur",
    "country": "Indonesia",
    "postal_code": "343421"
  }
}
```

Response Body Error :

```json
{
  "errors": "Contact is not found"
}
```

## List Address API

Endpoint : GET /api/contacts/:contactId/addresses

Header :

- Authorization : token

Response Body Success :

```json
{
  "data": [
    {
      "id": 1,
      "street": "sudirman",
      "city": "Jember",
      "province": "Jawa Timur",
      "country": "Indonesia",
      "postal_code": "343421"
    },
    {
      "id": 2,
      "street": "sudirman",
      "city": "Jember",
      "province": "Jawa Timur",
      "country": "Indonesia",
      "postal_code": "343421"
    }
  ]
}
```

Response Body Error :

```json
{
  "errors": "Contact is not found"
}
```

## Remove Address API

Endpoint : DELETE /api/contacts/:contactId/addresses/:contactId

Header :

- Authorization : token

Response Body Success :

```json
{
  "data": "OK!"
}
```

Response Body Error :

```json
{
  "errors": "Address is not found"
}
```
