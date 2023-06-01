#!/bin/sh

# Called by 'git push' it has checked the pronto ckecks,
# but before anything has been pushed.


# git fetch origin master
# DISABLE_SPRING=1 bundle exec rspec .
echo ""
echo ""

current_branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
skip_branch='staging'

# EXIT IF STAGING
if [ $current_branch = $skip_branch ]
  then
    echo "******  RUN RSPEC ON STAGING BRANCH ******"
    echo "Because if it's failed on staging, it will stop development"
    echo ""

    bundle exec rspec ./spec
    status=$?

    if [ $status -ne 0 ]
      then
        echo ""
        echo "******  PLEASE FIX RSPEC ISSUES BEFORE PUSH!!! ******"
      else
        echo ""
        echo "******  DONE WITH RSPEC CHECKS ******"
    fi

    exit $status
fi

# PRONTO CHECK's
echo "******  RUNNING RUBOCOP CHECKS ******"
bundle exec pronto run -f text -r rubocop --exit-code
status=$?

if [ $status -ne 0 ]
  then
    echo ""
    echo "******  PLEASE FIX RUBOCOP ISSUES BEFORE PUSH!!! ******"
  else
    echo ""
    echo "******  DONE WITH RUBOCOP CHECKS ******"
fi

echo ""
echo ""
exit $status
