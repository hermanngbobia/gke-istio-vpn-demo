#! /usr/bin/env bash

# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This script updates the values in the database located on the specified
# instance

set -e

if [[ $4 =~ ^[1-5]$ ]]; then
  COMMAND="mysql -u root --password=password test -e \"update ratings set rating=${4} where reviewid=1\""
  gcloud compute ssh "${3}" --project "${1}" --zone "${2}" --command "${COMMAND}"
  exit 0
fi

echo "Passed an invalid value to update the database. Aborting..."
exit 1
