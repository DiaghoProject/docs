# Front

## Add front library or framework with webpack

1. Connection to container `diagho_frontend`

2. Install the library / framework

        npm install --save-dev bootstrap
        
3. Update naming version in `package.json` and update dependencies

        "bootstrap": "~5.1.3",

        npm update  # Check if a new version is available

4. Import scss and js 

Create scss file in `frontend/src/scss/` and js file in `frontend/src`

5. Link the library / framework with webpack

Import your library / framework in a js file for the template `frontend/src/common/django` and create an entry in webpack conf `webpack.django.js`

6. Create a bundle

Build Webpack to create a bundle and call it in your back's template
            
    npm run build

7. Collectstatic

In the container `diagho_core` we need to collect the static files into STATIC_ROOT

    make collectstatic

## Manage flexbox containers with Bootstrap

- Documentation 

https://getbootstrap.com/docs/4.0/utilities/flex/
https://css-tricks.com/snippets/css/a-guide-to-flexbox/

- Create row 

        <div class="d-flex flex-row">
            <div class="p-2">Flex item 1</div>
            <div class="p-2">Flex item 2</div>
            <div class="p-2">Flex item 3</div>
        </div>   

- Create column 

        <div class="d-flex flex-column">
            <div class="p-2">Flex item 1</div>
            <div class="p-2">Flex item 2</div>
            <div class="p-2">Flex item 3</div>
        </div>

- Wrap rows in column

        <div class="d-flex flex-column">
            <div class="d-flex flex-row">
                Flex item 1
            <div class="p-2">Flex item 2</div>
            <div class="p-2">Flex item 3</div>
        </div>

