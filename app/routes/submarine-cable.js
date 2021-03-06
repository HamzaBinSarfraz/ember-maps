import Route from '@ember/routing/route';
import { getOwner } from '@ember/application';
import $ from 'jquery';

export default Route.extend({
  setupController(controller, model){
    this._super(...arguments);
    window.scrollTo(0,0);
    let application = getOwner(this).application;
    $.getJSON(`${application.apiPath}/cable/${application.getSlug(model)}.json`, function(data){
      controller.set("model",  data);
      if(application.map){
        application.map.selectCable(data.id, data.landing_points, data);
      }
    });


    // $.getJSON(`${application.apiPath}/landing-point/${application.getSlug(model)}.json`, function(data){
    //   controller.set("model",  data);
    //   if(application.map){
    //     console.log("Inside LatLng function");
    //     application.map.selectLandingPoint(data.name, new google.maps.LatLng(data.latitude, data.longitude));
    //   }
    // });

  }
});
