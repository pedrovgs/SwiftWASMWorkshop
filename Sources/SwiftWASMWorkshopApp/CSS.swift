let appCss = """
body {
    font-family: "Haas Grot Text R Web", "Helvetica Neue", Helvetica, Arial, sans-serif;
    width: 100vw;
    height: 100vh;
    margin: 0;
    background: #2E2B2B;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 40px;
}

.title {
    color: #FFFFFF;
    text-align: center;
}

.button {
    outline: 0;
    color: #FFFFFF;
    background-color: #3A5378;
    line-height: 1.5;
    text-align: center;
    border: 1px solid transparent;
    padding: 8px 16px;
    font-size: 16px;
    border-radius: .25rem;
    transition: all 400ms ease;
}

.button:not(:disabled):hover {
    cursor: pointer;
    color: #CDCDCD;
    background-color: #2A3D59;
}

button:disabled{
  background-color: #CCCCCC;
  color: #AAAAAA;
}

.subtitle {
    color: #FFFFFF;
}

.input {
    color: #000000;
    min-width: 300px;
    text-align: center;
    font-size: 14px;
    border-radius: 6px;
    line-height: 1.5;
    padding: 5px 10px;
    transition: box-shadow 100ms ease-in, border 100ms ease-in, background-color 100ms ease-in;
    border: 2px solid #dee1e2;
    color: rgb(14, 14, 16);
    background: #dee1e2;
    display: block;
    height: 36px;
}

.input:hover {
    border-color: #ccc;
}
.input:focus{
    border-color: #9147ff;
    background: #fff;
}
                

""";
