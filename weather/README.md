# Weather application for android and ios phones

This is a weather application written in dart language under flutter environment.

This app displays the weather of the current location (based on IP). Also, the user can navigate to other locations using openstreetmap to view the weather of that respective location.


There are two keys missing in the apis.dart which the developer needs to get from the respective websites in order to access the free apis.

In the file lib/apis.dart, the developer has to edit two lines:

static final String TOKEN = "XXXX"; The developer can get the api token from https://api.airvisual.com/v2"

static final String IPGL_TOKEN = 'XXXXX'; The developer can get the api token from https://api.ipgeolocation.io


This project is still under construction. The temperature line plot is current faked. The plan is to use so appropriate api to draw temperature data and display the temperature predictions of next few days.
