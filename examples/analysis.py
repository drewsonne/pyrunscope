#! /usr/bin/env python
import runscope

client = runscope.client('admin')

for bucket in client.buckets.all():
    print dict(bucket)