// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// Reload page with selected instrument
function changeINStype(inst) {
    location.href=location.pathname+'?type='+inst;
}