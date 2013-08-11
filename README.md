typo3analytics Cookbook
========================
Sets up a working environment for [TYPO3-Analytics](https://github.com/andygrunwald/TYPO3-Analytics)

Requirements
------------
A checkout of [TYPO3-Analytics](https://github.com/andygrunwald/TYPO3-Analytics)

#### packages
- `composer`
- `database`
- `mysql`

Attributes
----------

#### typo3analytics::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>[:typo3analytics][:composer_file]</tt></td>
    <td>string</td>
    <td>Path to composer.json</td>
    <td><tt>/vagrant/composer.json</tt></td>
  </tr>
</table>

Usage
-----
#### typo3analytics::default

Just include `typo3analytics` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[typo3analytics]"
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
