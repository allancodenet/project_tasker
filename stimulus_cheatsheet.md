# Stimulus JS Cheatsheet

## Controller

| Feature       | Usage                                                                 |
|---------------|-----------------------------------------------------------------------|
| Generate      | `rails g stimulus controller-name`                                    |
| HTML          | `data-controller="controller-name"`                                   |
| Ruby Tags     | `data: { controller: "controller-name" }`                             |

---

## Action

| Feature       | Usage                                                                 |
|---------------|-----------------------------------------------------------------------|
| JS            | `methodName() {}`                                                     |
| HTML          | `data-action="event->controller-name#methodName"`                     |

---

## Target

| Feature       | Usage                                                                 |
|---------------|-----------------------------------------------------------------------|
| JS            | `static targets = ["targetName"]`                                     |
| HTML          | `data-controller-name-target="targetName"`                            |

---

## Value

| Feature       | Usage                                                                 |
|---------------|-----------------------------------------------------------------------|
| JS            | `static values = { attributeName: dataType }`                         |
| HTML          | `data-controller-name-attribute-name-value="value"`                   |

---

## Class

| Feature       | Usage                                                                 |
|---------------|-----------------------------------------------------------------------|
| JS            | `static classes = ["descriptionName"]`                                |
| HTML          | `data-controller-name-description-name-class="hidden"`                |

---

## Notes

- It is recommended that the `data-controller` attribute be defined on the **same HTML element**.
- CSS class attributes (`data-controller-name-description-name-class`) **must be on the same element** as the `data-controller`.

---

## Naming Conventions

| Style        | Example           |
|--------------|-------------------|
| camelCase    | `exampleName`     |
| kebab-case   | `example-name`    |
| snake_case   | `example_name`    |
| PascalCase   | `ExampleName`     |
