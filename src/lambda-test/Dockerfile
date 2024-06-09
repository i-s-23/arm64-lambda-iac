FROM public.ecr.aws/lambda/python:3.12
COPY ./requirements.txt ${LAMBDA_TASK_ROOT}
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
# Copy function code
WORKDIR ${LAMBDA_TASK_ROOT}
COPY ./app.py ${LAMBDA_TASK_ROOT}
# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD ["app.lambda_handler"]
