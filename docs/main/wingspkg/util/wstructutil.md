# wstructutil.nim

## Imports

-   strutils
    -   split
-   tables
-   [../lib/wstruct](../lib/wstruct.md)
-   [../lang/go](../lang/go.md)
-   [../lang/kt](../lang/kt.md)
-   [../lang/nim](../lang/nim.md)
-   [../lang/py](../lang/py.md)
-   [../lang/ts](../lang/ts.md)

## Functions

### `public`

#### `genFiles: Table[string, string]`

Generate the files for all the natively supported output types.

| Argument  | Type      | Description                                |
| :-------- | :-------- | :----------------------------------------- |
| `wstruct` | `WStruct` | `WStruct` object source for the out files. |