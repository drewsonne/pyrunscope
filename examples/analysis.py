#! /usr/bin/env python
import csv
import sys
import runscope

client = runscope.client('admin')

fp = csv.writer(sys.stdout)

for bucket in client.buckets.all():
    print "Searching {id}".format(id=bucket.key)
    for tests in bucket.tests.all():
        for result in tests.results.all():
            if (int(result.scripts_failed) > 0) or (result.result == u'fail'):
                fp.writerow(dict(result).values())
