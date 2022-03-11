# Interpretation service

!!! attention
    Page obsolète!

!!! link ""
    ![Variant Interpretation Service. Contribute to DiaghoProject/diagho development by creating an account on GitHub.](https://avatars.githubusercontent.com/u/77725721?s=400&v=4){: style="width: 20%;" align=left }

    **GitHub**  
    **[DiaghoProject/diagho](https://github.com/DiaghoProject/diagho)**

    Variant Interpretation Service.

## Architecture
![Architecture](/architecture/interpretation/images/Diagho_Interpretation.png)

## Core

### Django models

#### BaseModel
![Base model schema](interpretation/images/base_model_schema.svg)

#### Users / permissions
![User model schema](interpretation/images/user_model_schema.svg)

## Processes

### Description

#### How are the processes connected to each other?
![Process schema](interpretation/images/base_process_schema.svg)

#### Example: VariantCalling Process
![VariantCalling Process schema](interpretation/images/variant_calling_process_schema.svg)

#### Example: Annotation Process
![Annotation Process schema](interpretation/images/annotation_process_schema.svg)

#### Example: Filter Process
![Filter Process schema](interpretation/images/filter_process_schema.svg)

#### Example: Boolean Processes
- `ConjunctionProcess`
- `DisjunctionProcess`
- `ExclusiveDisjunctionProcess`

![Boolean Process schema](interpretation/images/boolean_process_schema.svg)


### Django models

#### Process base model
![Process model schema](interpretation/images/process_model_schema.svg)

#### Variant calling process
![VariantCalling process model schema](interpretation/images/variant_calling_process_model_schema.svg)

#### Annotation process
![Annotation process model schema](interpretation/images/annotation_process_model_schema.svg)

#### Filter process
![Filter process model schema](interpretation/images/filter_process_model_schema.svg)
