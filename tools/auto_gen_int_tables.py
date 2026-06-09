# /// script
# requires-python = ">=3.9"
# dependencies = [
#   "pyyaml>=6.0",
# ]
# ///

import yaml
import os
import argparse

# --- GLOBAL DEFAULTS ---
DEFAULT_SOURCE_PATH = '/path/to/your/project/models/staging/classic_models/_sources.yml'
DEFAULT_OUTPUT_DIR = '/path/to/your/project/models/staging/classic_models'
DEFAULT_UID = 'uid'
DEFAULT_TS = 'op_commit_time'
DEFAULT_ORDER_BY = 'op_commit_time desc'
FILE_PREFIX = 'int'

def generate_models(args):
    source_path = args.source_file
    output_dir = args.output_dir

    if not os.path.exists(output_dir):
        os.makedirs(output_dir, exist_ok=True)

    try:
        with open(source_path, 'r') as f:
            config = yaml.safe_load(f)
    except Exception as e:
        print(f"❌ Error loading YAML: {e}")
        return

    if not config or not isinstance(config, dict):
        print("❌ YAML file is empty or not a valid mapping. Nothing to process.")
        return

    processed_count = 0
    skipped_count = 0

    for source in config.get('sources', []):
        source_name = source.get('name')

        for table in source.get('tables', []):
            table_name = table.get('name')

            if args.table and table_name != args.table:
                continue

            uid_col = args.uid
            ts_col = args.ts
            order_by = args.order_by
            model_name = f"{FILE_PREFIX}_{source_name}__{table_name}"

            sql_path = os.path.join(output_dir, f"{model_name}.sql")
            yml_path = os.path.join(output_dir, f"{model_name}.yml")

            if not args.overwrite and (os.path.exists(sql_path) or os.path.exists(yml_path)):
                print(f"⚠️  Skipped (already exists): {model_name} — use --overwrite to regenerate")
                skipped_count += 1
                continue

            sql_content = (
                "-- {{ source('"
                f"{source_name}', "
                f"'{table_name}'"
                ") }}"
                "\n\nwith deduped_silver as (\n"
                "{{ "
                f"dbt_utilities.incremental_dedupe(\n"
                f"    source_name = '{source_name}',\n"
                f"    table_name = '{table_name}',\n"
                f"    unique_key = '{uid_col}',\n"
                f"    watermark_col = '{ts_col}',\n"
                f"    dedupe_order_by = '{order_by}'\n"
                ")"
                " }}\n"
                ")\n\n"
                "select * from deduped_silver"
                "\n"
            )

            columns_list = []
            for col in table.get('columns', []):
                col_name = col.get('name')
                col_def = {
                    "name": col_name,
                    "data_type": col.get('data_type'),
                    "description": col.get('description', '')
                }
                columns_list.append(col_def)

            columns_list.append({
                "name": "dbt_updated_at",
                "data_type": "timestamp",
                "description": "Timestamp of when dbt processed this record"
            })

            yml_dict = {
                "version": 2,
                "models": [{
                    "name": model_name,
                    "description": f"Intermediate model for {table_name}. Deduplicated on {uid_col}.",
                    "config": {"access": "public"},
                    "columns": columns_list
                }]
            }

            with open(sql_path, 'w') as f:
                f.write(sql_content)

            with open(yml_path, 'w') as f:
                yaml.dump(yml_dict, f, sort_keys=False, default_flow_style=False, allow_unicode=True)

            print(f"✅ Generated: {model_name}.sql and .yml")
            processed_count += 1

    print(f"\n🚀 Total models generated: {processed_count}")
    if skipped_count:
        print(f"⚠️  Total models skipped (already exist): {skipped_count} — rerun with --overwrite to regenerate these")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Generate dbt intermediate models and schema YAMLs from a source YAML file."
    )
    parser.add_argument('--source_file', type=str, default=DEFAULT_SOURCE_PATH)
    parser.add_argument('--output_dir', type=str, default=DEFAULT_OUTPUT_DIR)
    parser.add_argument('--table', type=str)
    parser.add_argument('--uid', type=str, default=DEFAULT_UID)
    parser.add_argument('--ts', type=str, default=DEFAULT_TS)
    parser.add_argument('--order_by', type=str, default=DEFAULT_ORDER_BY)
    parser.add_argument('--overwrite', action='store_true', default=False)

    args = parser.parse_args()
    generate_models(args)