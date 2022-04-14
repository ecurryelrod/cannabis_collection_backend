## strain
- name
- description
- terpene (flavor/aroma)
- thc_amount
- cbd_amount
- cbg_amount
- has_many :effects
- belongs_to :type

## effect
- name
- has_many :strains

## type
- name (sativa, indica, hybrid)
- has_many :strains