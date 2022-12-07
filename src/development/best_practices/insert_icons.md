# Icons

## Presentation

To insert icons in our html page, we use the unified icon framework : [Iconify](https://iconify.design/) which is managed by webpack.

We just need to find an icon in [icones.js](https://icones.js.org/), icones.js collects a large database of icons from other icons manager website and gather it all. 

Because we are using Bulma like css framework, we need to integrates our icons into it. 

## How to insert icons with bulma

Choose an icon in [icones.js](https://icones.js.org/) and copy the id

Insert into HTML page the markup bellow in depending on the case and replace `data-icon` with the copied id 

### Generic usage 

    <span class="iconify-inline" data-icon="fa6-solid:virus"></span>

### Exceptions (For Bulma tabs)

    <span class="icon is-small">
        <span class="iconify-inline" data-icon="fa6-solid:image"></span></span>
    <span>Pictures</span>
