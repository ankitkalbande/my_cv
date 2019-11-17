.PHONY: examples

CC = xelatex
#FOLDER_NAME = examples_medha
FOLDER_NAME = examples_ankit
EXAMPLES_DIR = $(FOLDER_NAME)
RESUME_DIR = $(FOLDER_NAME)/resume
CV_DIR = $(FOLDER_NAME)/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

examples: $(foreach x, coverletter resume, $x.pdf)

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -interaction nonstopmode -output-directory=$(EXAMPLES_DIR) $<

#cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
#	$(CC) -interaction nonstopmode -output-directory=$(EXAMPLES_DIR) $<

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -interaction nonstopmode -output-directory=$(EXAMPLES_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf
