#!/bin/bash

for rpm_file in *.rpm; do
    rpm2cpio $rpm_file | cpio -idmv '*.spec'
done

