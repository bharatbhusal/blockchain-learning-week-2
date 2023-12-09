// Exercise 8: Asynchronous Data Fetch
//   - Use JavaScript's Fetch API to retrieve data from the https://jsonplaceholder.typicode.com/.
//   - Handle potential errors using both Promises (**`.then`** & **`.catch`**) and Async/Await.



// Fetch API without Async/Await - no error
fetch("https://jsonplaceholder.typicode.com/todos/55")
    .then(response => response.json())
    .then(data => {
        console.log("Fetch API without Async/Await - no error")
        console.log(data)
    })
    .catch(error => console.error("Error fetching data:", error.message));

// Fetch API without Async/Await - error
fetch("https://jsonplaceholder.typicode.com")
    .then(response => response.json())
    .then(data => console.log(data))
    .catch(error => {
        console.log("\nFetch API without Async/Await - error")
        console.error("Error fetching data:", error.message)
    });

// Fetch API with Async/Await - error
async function withError() {
    try
    {
        const url = "https://jsonplaceholder.typicode.com"
        const response = await fetch(url)
        const data = await response.json()
        console.log(data)
    } catch (error)
    {
        console.log("\nFetch API with Async/Await - error")
        console.error(error.message)
    }
}


// Fetch API with Async/Await - no error    
async function noError() {
    try
    {
        const url = "https://jsonplaceholder.typicode.com/todos/55"
        const response = await fetch(url)
        const data = await response.json()
        console.log("\nFetch API with Async/Await - no error")
        console.log(data)
    } catch (error)    
    {
        console.error(error.message)
    }
}

// calling async functions
withError()
noError()
