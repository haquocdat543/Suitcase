# JQ 

## Usage
#### 1. Installation
```bash
yum install -y jq
```
```bash
apt install -y jq
```
```bash
pacman -Sy --noconfirm jq
```
#### 2. Example data
Write following data to `seaCreatures.json`
```bash
[
    { "name": "Sammy", "type": "shark", "clams": 5 },
    { "name": "Bubbles", "type": "orca", "clams": 3 },
    { "name": "Splish", "type": "dolphin", "clams": 2 },
    { "name": "Splash", "type": "dolphin", "clams": 2 }
]
```
#### 3. Example
##### 1. Normal query

```bash
jq '.' seaCreatures.json 
```
Output:
```bash
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
```bash
jq '.[]' seaCreatures.json
```
Output:
```bash
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
```bash
jq -r '.[] | .name' seaCreatures.json
```
Output:
```bash
Sammy
Bubbles
Splish
Splash
```

##### 4. Get docker swarm config value
```bash
docker config inspect $CONFIG_NAME | jq -r '.[] | .Spec | .Data' | base64 --decode
```
