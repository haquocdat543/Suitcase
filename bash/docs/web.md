# WEB

## 1. Basic
### 1. HTML
#### 1. Elements
h1
```
<h1> Content </h1>
```

h2
```
<h2> Content </h2>
```

hN
```
<hN> Content </hN>
```

p
```
<p> Content </p>
```

##### button
```
<button> Content </button>
```
Attribute:

* onClick:
```
<button onClick={handleClick}> Click me</button>
```

#### 2. Attributes
name ( name of element ):

className ( class of element ):
```
className=NavBar
```

id ( id of element ):
```
id=Navigation-Bar
```

placeholder ( text inside a button or input field ):
```
placeholder="Your Name"
```

css ( css directly inside element ):
```
css={{ padding: "2px 4px 2px" }}
```

### 2. CSS
* . mean class
```
.App {
  text-align: center;
}
```

* # mean id
```
.App {
  text-align: center;
}
```

### 3. JAVASCRIPT
#### function
```
const function_name = () => {
  function_logic_block
  return return_value
}
```
___
## 2. Common framwork
### 1. ReactJS
#### 1. Initialize project
```
npx create-react-app ${project_name}
```

#### 2. useState 
```
const [count, setCount] = useState();
```
* `count` and `setCount` can be anything.

#### 3. useEffect
#### 4. useMemo
#### 5. useCallback
#### 5. useRef
#### 6. useReducer
#### 7. useTransition
#### 8. useDefferedValue
#### 8. useContext

### 2. AngularJS

### 3. VueJS
___
## 3. Common library
### 1. Express
```
npm install express
```

### 2. Mongoose
```
npm install mongoose
```

### 3. UUID
```
npm install uuid
```

