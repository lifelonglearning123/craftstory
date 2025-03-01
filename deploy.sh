#!/bin/bash

# Create .streamlit directory if it doesn't exist
mkdir -p .streamlit

# Create secrets.toml with environment variables
cat > .streamlit/secrets.toml << EOL
# OpenAI secrets
OPENAI_API_KEY = "$OPENAI_API_KEY"

# Astra DB secrets
ASTRA_ENDPOINT = "$ASTRA_ENDPOINT"
ASTRA_TOKEN = "$ASTRA_TOKEN"

# Optionally: LangSmith secrets for tracing
LANGCHAIN_TRACING_V2 = "$LANGCHAIN_TRACING_V2"
LANGCHAIN_ENDPOINT = "$LANGCHAIN_ENDPOINT"
LANGCHAIN_API_KEY = "$LANGCHAIN_API_KEY"
LANGCHAIN_PROJECT = "$LANGCHAIN_PROJECT"

[passwords]
# Follow the rule: username = "password"
# Where username defines the Astra Vector Table and the rails.csv experience
postnl = "$POSTNL_PASSWORD"
datastax = "$DATASTAX_PASSWORD"
leonardo = "$LEONARDO_PASSWORD"

[languages]
# Follow the rule: username = "localization_code"
# Where localization_code defines the language from localization.csv
postnl = "$POSTNL_LANGUAGE"
datastax = "$DATASTAX_LANGUAGE"
leonardo = "$LEONARDO_LANGUAGE"

[delete_option]
# Follow the rule: username = "delete_option"
# Where delete_option = True allows the 'Delete Context' button to be shown for that username
datastax = "$DATASTAX_DELETE_OPTION"
EOL

# Start Streamlit
python -m streamlit run streamlit_app.py --server.port 8000 --server.address 0.0.0.0