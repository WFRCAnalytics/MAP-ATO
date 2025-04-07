# MAP-ATO-App

TAZ-based Access to Opportunities (ATO) data is accessed from this web map. The web map also displays a trend line for each TAZ that factors in future land use and transportation system performance at that location relative to the regional average. The ATO webmap now has the ability to display ATO adjusted for subsets (ex. Northern Davis County) of the Wasatch Front that was previously available in static PDF maps.

The Esri Web AppBuilder (WAB) app can be found in the `_site` folder and at https://wfrc.org/ato-map/

The following files prepare the data for the webapp:

**1_Simplify-TAZs.ipynb:** This notebook takes the standard TAZ shapefile and creates a simplified version that is more suitable and responsive in online use.

**2_ATO-Web-App.ipynb:** This notebook calculates ATO average values for each area. For the final feature class, the display is done by percente of average threshold bins. 

**3_WFRC-Data-Portal.ipynb:** This notebook creates the ATO data that is shared in the data portal.

**4_PreProcess-TravelSheds.s:** This Voyager script preps the TDM results for use in travelshed notebooks.

**5_Travel-Sheds.ipynb:** This notebook preps all the travel sheds into geojsons by mode and year.

**6_Create-TravelShed-Geodatabase.ipynb:** This notebook creates a geodatabase that is then uploaded to ArcGIS Online to be used in web app.
