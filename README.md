# apex-nprogress
Dyanmic action plug-in for Oracle APEX based on NProgress by Rico Sta Cruz.

http://ricostacruz.com/nprogress/

## Installation
* Import "apex_nprogress_import.sql" via APEX application import.

 or

* Run "apex_nprogress_import.sql" via SQLPlus whilst connected to APEX parsing schema.

## Usage

The NProgress plug-in is built with simplicity in mind. It supports just two actions. Start and Stop. Once started, the progress bar will increment slowly, giving the user the impression of background activity. The Stop action will completely fill and then hide the progress bar.

* Use an NProgress dynamic action with an action of "Start" in order to begin progress bar animation.

  *Additional options when starting NProgress*
  * Show Spinner? - Do you wish to display an additional spinner animation.
  * Parent Element - Where do you want progress bar to be displayed? Accepts a CSS selector specifying container. e.g. '#myRegion'. Defaults to body.

* Use an NProgress dynamic action with an action of "Stop" in order to complete progress bar animation.

![nprogress preview](https://raw.githubusercontent.com/drumbeg/apex-nprogress/master/nprogress.png)
