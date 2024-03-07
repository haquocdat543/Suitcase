# JQ 

## Usage
#### 1. Installation
```
yum install -y jq
```
```
apt install -y jq
```
```
pacman -Sy --noconfirm jq
```
#### 2. Example data
Write following data to `seaCreatures.json`
```
[
    { "name": "Sammy", "type": "shark", "clams": 5 },
    { "name": "Bubbles", "type": "orca", "clams": 3 },
    { "name": "Splish", "type": "dolphin", "clams": 2 },
    { "name": "Splash", "type": "dolphin", "clams": 2 }
]
```
#### 3. Example
##### 1. Normal query

```
jq '.' seaCreatures.json 
```
Output:
```
[
  {
    "name": "Sammy",
    "type": "shark",
    "clams": 5
  },
  {
    "name": "Bubbles",
    "type": "orca",
    "clams": 3
  },
  {
    "name": "Splish",
    "type": "dolphin",
    "clams": 2
  },
  {
    "name": "Splash",
    "type": "dolphin",
    "clams": 2
  }
]
```
##### 2. Query inside block
```
jq '.[]' seaCreatures.json
```
Output:
```
{
  "name": "Sammy",
  "type": "shark",
  "clams": 5
}
{
  "name": "Bubbles",
  "type": "orca",
  "clams": 3
}
{
  "name": "Splish",
  "type": "dolphin",
  "clams": 2
}
{
  "name": "Splash",
  "type": "dolphin",
  "clams": 2
}
```
##### 3. Query part without ""
```
jq -r '.[] | .name' seaCreatures.json
```
Output:
```
Sammy
Bubbles
Splish
Splash
```

##### 4. Get docker swarm config value
```
docker config inspect $CONFIG_NAME | jq -r '.[] | .Spec | .Data' | base64 --decode
```
