# Google cloud platform guide

A guide for Google cloud platform (GCP).

## APIs and services
When using working with GCP, the user will need to enable the APIs required for the features they will be using.
Here is a list of APIs the user will need to activate for storage, workflows, dataflows, and triggers.

- Cloud:
  - Cloud Pub/Sub API
  - Cloud storage
  - Cloud logging API
  - Cloud storage JSON API
  - BigQuery API
  - Cloud datastore API
  - Compute Engine API
- Workflow:
  - Workflow API
  - Workflow executions API
  - Eventarc API
  - Cloud scheduler API
- Dataflow:
  - Dataflow API

> This does not mean the user needs to make use of all these APIs, it only points out important cases

To activate any of the above, do the following:
- On the dashboard, click on **APIs and services**

![GCP API services](img/gcp-api-services.png)

- Select **Library**. This will take the user to a library which contains the available APIs
- The simplest method, if the API name is known, is to search for the API in the search bar
- For this guide, type “Cloud pub/sub api” in the search bar and press **Enter**

![GCP API search](img/gcp-api-search.png)

- Select the *Cloud Pub/Sub API* result
- Click **Enable**
- Do this for all required APIs and services

If an API is required for a function by GCP which has not been activated, the user will be prompted to enable it.

## Cloud storage

## Workflow

## Dataflow

## BigQuery

### Add table

### Table schema

### Notes

## Python

### Locally run python code

### Bucket trigger events

### Pub/Sub trigger events

### Dataflow pipeline using Python

### BigQuery in Python