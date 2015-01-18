[![Build Status](https://travis-ci.org/swatkns785/lets-jam-some-time.svg?branch=master)](https://travis-ci.org/swatkns785/lets-jam-some-time) [![Code Climate](https://codeclimate.com/github/swatkns785/lets-jam-some-time.png)](https://codeclimate.com/github/swatkns785/lets-jam-some-time) [![Coverage Status](https://coveralls.io/repos/swatkns785/lets-jam-some-time/badge.png)](https://coveralls.io/r/swatkns785/lets-jam-some-time)

January 12, 2015

*Implemented Soundcloud sign-in and authentication functionality.

*Wrote test and appropriate code for an authenticated user to create jam session.


January 13, 2015

*Wrote tests and code for editing and deleting a jam session.

*Wrote tests and code for preventing a user from deleting or editing the information on another user's jam session.

*Wrote tests and code for user to request joining a jam session.

*Wrote tests preventing a prospective attendee from seeing the location of the jam session unless they are approved by the creator of the jam session.


January 14, 2015

*Approved attendee can leave a jam session.

*Wrote some view validations for jam session creator functionality.

*Implemented functionality for a jam session creator to approve prospective attendees for the jam session.

*Wrote seed file for development database


January 15, 2015

*Implemented functionality for a jam session attendee to upload to their personal soundcloud account via this app.

-Technical difficulties

  -Establishing connection to Soundcloud API proved difficult

  -Determing how to format the POST request to the API

  -Determining success in test environment without valid Souncloud API token

January 16, 2015

-Styled the home page and refactored some extraneous code.

January 17, 2015

-Installed Geokit gem to retrieve latitude and longitude for faster search functionality. Currently having issues where I create a jam session, the post request enters an infinite loop and I run out allocated queries for a given time period.
