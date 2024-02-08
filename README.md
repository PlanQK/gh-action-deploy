# PlanQK GitHub Action Deploy 

GitHub Action to update a PlanQK service.

## Use

First setup two repository secretes `$PLANQK_TOKEN` and `$CONTEXT_ID`.
`$PLANQK_TOKEN` must be a valid access token with access to the PlanQK API that can be used with `planqk login -t $PLANQK_TOKEN` (see [PlanQK CLI Docs](https://docs.platform.planqk.de/cli-reference.html#authentication)).
`$CONTEXT_ID` must be the id of the context that can be retrieved by `planqk list-contexts` (see [PlanQK CLI Docs](https://docs.platform.planqk.de/cli-reference.html#planqk-list-contexts)).

Then, you can use this action in a job like following.

```
jobs:
  # This workflow contains a single job called "deploy"
  deploy:
    # The type of runner that the job will run on
    runs-on: ubuntu-latest

    # Steps represent a sequence of tasks that will be executed as part of the job
    steps:
      # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
      - uses: actions/checkout@v4

      - shell: bash
        env:
          CONTEXT_ID: ${{ vars.CONTEXT_ID }}
          PLANQK_TOKEN: ${{ secrets.PLANQK_TOKEN }}
        run: |
          echo "Output:"
          echo $CONTEXT_ID
          echo $PLANQK_TOKEN

      # Updates your service on PanQK
      - uses: PlanQK/update-service-action@v1
        with:
          PLANQK_TOKEN: ${{ secrets.PLANQK_TOKEN }}
          CONTEXT_ID: ${{ vars.CONTEXT_ID }}
```
