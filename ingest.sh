#!/bin/bash
# script to inline all files of the project into a markdown
# Source for AI chat.

# Output file
OUTPUT_FILE="context.md"

# Clear the output file
> "$OUTPUT_FILE"

# Find all files excluding README.md, .git, .idea directories, .gitignore, ingest.sh, and context.md
find . -type f \( ! -path "*/.git/*" ! -path "*/.idea/*" ! -name "README.md" ! -name ".gitignore" ! -name "ingest.sh" ! -name "context.md" \) | while read -r file; do
  echo "Processing: $file"

  # Add the file path as a header
  echo "\`$file\`" >> "$OUTPUT_FILE"
  echo '```' >> "$OUTPUT_FILE"

  # Append the content of the file, ensuring UTF-8 encoding
  iconv -f "UTF-8" -t "UTF-8" "$file" >> "$OUTPUT_FILE"

  echo '```' >> "$OUTPUT_FILE"
  echo >> "$OUTPUT_FILE"

done

echo "All files have been inlined into $OUTPUT_FILE."
