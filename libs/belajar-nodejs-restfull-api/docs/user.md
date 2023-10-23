# User API Spec

## Register User API

Endpoint : POST /api/users

Request Body :

```json
{
  "username": "wapi",
  "password": "boneka",
  "name": "Syahroni Bawafi"
}
```

Response Body Success :

```json
{
  "data": {
    "username": "wapi",
    "name": "Syahroni Bawafi"
  }
}
```

Response Body Error :

```json
{
  "errors": "Username already resgitered"
}
```

## Login User API

Request Body :

```json
{
  "username": "wapi",
  "password": "boneka"
}
```

Response Body Success :

```json
{
  "data": {
    "token": "unique-token"
  }
}
```

Response Body Error :

```json
{
  "errors": "Username or password wrong"
}
```

## Update user API

Endpoint : PATCH /api/users/current

Headers :

- Authorization : token

Request Body :

```json
{
  "name": "Syahroni Bawafi lagi", // optional
  "password": "new password" // optional
}
```

Response Body Success :

```json
{
  "data": {
    "username": "wapi",
    "name": "Syahroni Bawafi lagi"
  }
}
```

Response Body Error :

```json
{
  "errors": "name length max 100"
}
```

## Get User API

Endpoint : GET /api/users/current

Headers :

- Authorization : token

Response Body Success :

```json
{
  "data": {
    "username": "wapi",
    "name": "Syahroni Bawafi"
  }
}
```

Response Body Error :

```json
{
  "errors": "Unauthorized"
}
```

## Logout User Api

Endpoint : DELETE /api/users/logout

Headers :

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
  "errors": "Unauthorized"
}
```
