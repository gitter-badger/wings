# plz.nim

This was some early draft I wrote that I never got around to test if they actually works.

## Imports

-   strutils
    -   indent

## Functions

### `public`

#### `goPlzBuild: string`

Generate the `go_library()` declaration for please build file.

| Argument     | Type          | Description |
| :----------- | :------------ | :---------- |
| `name`       | `string`      |             |
| `dep`        | `seq[string]` |             |
| `visibility` | `seq[string]` |             |

### `private`

#### `arr: string`

Generate the correct please tool array format.

| Argument | Type          | Description |
| :------- | :------------ | :---------- |
| `name`   | `string`      |             |
| `arr`    | `seq[string]` |             |