# Из JSON в JSON Scheme

1.[Сделает JSON ](https://codebeautify.org/jsonviewer)

```json
{
    "name": "Alex",                         
    "age": 28,                              
    "havePets": true,                       
    "petsName": ["Rex", "Bars", "Charles"], 
    "oneOfPets": {                          
             "petsName": "Rex",             
             "petsAge": 3,                  
             "petsType": "dog"              
        },
    "haveCar": null                         
}
```

Давайте сначала подумаем и разберемся:

1. Мы работаем с JSON и как мы помним, JSON - это объект

2. В нем есть 6 `"properties"`, а именно name, age, havePets, petsName, OneOfPets, `haveCar`

3. Кроме `haveCar` все остальные поля являются обязательными. Значит у нас есть 5 `"required"`

4. PetsName - является массивом. Внутри этого массива могут быть только строки

5. `oneOfPets` - является вложенным объектом. Соответсвенно у вложенного объекта есть свои обязательные (в данном случае) `"properties"`, а именно:

    * petsName
    * petsAge
    * petsType

    Соответственно все эти ключи, являются  `"required"`. При этом мы ждем, что petsName и petsType должны быть строками, а petsAge - числом. Это мы можем указать в `"type"`

6. `haveCar` - не является обязательным полем, поэтому он не входит в `"required"`
    
    Тип данных может быть `"null"` (в случае если пользователь не указал ничего в этом поле) или `"string"`, если пользователь указал марку автомобиля

### JSON Schema из описания

```json
{
    "type": "object",
    "properties": {
        "name":         {"type": "string"},
        "age":          {"type": "number"},
        "havePets":     {"type": "boolean"},
        "petsName":     {"type": "array", 
                        "items": {"type": "string"}
                        },
        "oneOfPets":    {"type": "object", 
                        "properties": {"petsName": {"type": "string"},
                                     "petsAge": {"type": "number"},
                                     "petsType": {"type": "string"}},
                        "required": [ "petsName", "petsAge", "petsType" ]
                        },
        "haveCar":      {"type": [ "null", "string" ]}
    },
    "required": [ "name", "age", "havePets", "petsName", "oneOfPets" ]
}
```




