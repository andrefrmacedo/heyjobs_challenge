# heyjobs_challenge

## Assumptions
For this challenge I made the follwing assumptions:
- The external api url is `https://mockbin.org/bin/fcb30500-7b98-476f-810d-463a0b8fc3df`
- The `Campaign` entity is passed as an hash argument of `HeijobsChallenge` service
- The `HeyjobsChallenge` service is supposed to run periodically


## Output
- Output when there are discrepancies:
```
[
  {
    remote_reference: 1,
    discrepancies: [
      status: {
        remote: "disabled",
        local: "active"
      },
      description: {
        remote: "Rails Engineer",
        local: "Ruby on Rails Developer"
      }
    ]
  }
]
```

- Output when there are no discrepancies:
```
[]
```

- Output when an error occurred:
```
{
  error: 'An unexpected error occurred'
}
```


## Setup
This was developed using `ruby2.6`.
Run `bundle` to install the required gems.

## Tests
All modules have unit tests.  
To run the tests run the command `rspec`
