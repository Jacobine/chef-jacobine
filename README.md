Jacobine Cookbook
========================
Sets up a working environment for [Jacobine](https://github.com/andygrunwald/Jacobine)

Requirements
------------
A checkout of [Jacobine](https://github.com/andygrunwald/Jacobine)

#### packages
- `composer`
- `database`
- `mysql`
- `supervisor`
- `logrotate`
- `apache2`

Attributes
----------

#### jacobine::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>[:jacobine][:composer_file]</tt></td>
    <td>string</td>
    <td>Path to composer.json</td>
    <td><tt>/vagrant/composer.json</tt></td>
  </tr>
</table>

Usage
-----
#### jacobine::default

Just include `jacobine` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[jacobine]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (`git checkout -b add_component_x`)
3. Write you change (hack hack hack)
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github
