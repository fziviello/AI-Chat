.PHONY: default download_resources web_server ollama_server

default: download_resources
	@$(MAKE) -j 2 web_server ollama_server

web_server:
	python3 -m http.server --bind 127.0.0.1

ollama_server:
	ollama serve

download_resources:
	# Check if resources directory exists, if not create it
	@if [ ! -d "resources" ]; then \
		mkdir -p ./resources/ && \
		cd ./resources/ && \
		curl -O https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css && \
		curl -O https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js && \
		curl -O https://cdn.jsdelivr.net/npm/marked@6.0.0/marked.min.js && \
		curl -O https://cdn.jsdelivr.net/npm/dompurify@3.0.5/dist/purify.min.js; \
		curl -O https://code.jquery.com/jquery-3.7.1.min.js; \
	fi

clean:
	@rm -rf ./resources
