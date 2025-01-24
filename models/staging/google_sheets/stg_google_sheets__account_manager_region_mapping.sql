select
    account_manager,
    state
from {{ source('sales_database', 'account_manager_region_mapping') }}