window.SubmarineCable = {}

class SubmarineCable.Map

  # @landing_points_table_id = "1Cl54ggURDqPMvVSuxaQM5mPinrdeDq9FDCGfg9T4"
  # @cables_table_id = "1lObSCM2_KCXIcbCfm_rbilwftWBbxAKszNyfOiL3"

  @mapStyles: [
				  {
					"elementType": "geometry",
					"stylers": [
					  {
						"color": "#f5f5f5"
					  }
					]
				  },
				  {
					"elementType": "labels.icon",
					"stylers": [
					  {
						"visibility": "off"
					  }
					]
				  },
				  {
					"elementType": "labels.text.fill",
					"stylers": [
					  {
						"color": "#616161"
					  }
					]
				  },
				  {
					"elementType": "labels.text.stroke",
					"stylers": [
					  {
						"color": "#f5f5f5"
					  }
					]
				  },
				  {
					"featureType": "administrative.country",
					"elementType": "geometry.stroke",
					"stylers": [
					  {
						"color": "#ffffff"
					  }
					]
				  },
				  {
					"featureType": "administrative.country",
					"elementType": "labels.text",
					"stylers": [
					  {
						"color": "#ffffff"
					  },
					  {
						"lightness": 100
					  },
					  {
						"visibility": "off"
					  },
					  {
						"weight": 1
					  }
					]
				  },
				  {
					"featureType": "administrative.country",
					"elementType": "labels.text.stroke",
					"stylers": [
					  {
						"visibility": "on"
					  }
					]
				  },
				  {
					"featureType": "administrative.land_parcel",
					"elementType": "labels.text.fill",
					"stylers": [
					  {
						"color": "#c0c0c0"
					  }
					]
				  },
				  {
					"featureType": "administrative.province",
					"elementType": "labels.text",
					"stylers": [
					  {
						"visibility": "off"
					  }
					]
				  },
				  {
					"featureType": "landscape",
					"elementType": "geometry.fill",
					"stylers": [
					  {
						"color": "#c9d7f5"
					  }
					]
				  },
				  {
					"featureType": "poi",
					"elementType": "geometry",
					"stylers": [
					  {
						"color": "#eeeeee"
					  }
					]
				  },
				  {
					"featureType": "poi",
					"elementType": "geometry.fill",
					"stylers": [
					  {
						"color": "#c9d7f5"
					  }
					]
				  },
				  {
					"featureType": "poi",
					"elementType": "labels.text.fill",
					"stylers": [
					  {
						"color": "#757575"
					  }
					]
				  },
				  {
					"featureType": "poi.attraction",
					"elementType": "geometry.fill",
					"stylers": [
					  {
						"color": "#c9d7f5"
					  }
					]
				  },
				  {
					"featureType": "poi.business",
					"elementType": "geometry.fill",
					"stylers": [
					  {
						"color": "#c9d7f5"
					  }
					]
				  },
				  {
					"featureType": "poi.park",
					"elementType": "geometry",
					"stylers": [
					  {
						"color": "#e5e5e5"
					  }
					]
				  },
				  {
					"featureType": "poi.park",
					"elementType": "geometry.fill",
					"stylers": [
					  {
						"color": "#c9d7f5"
					  }
					]
				  },
				  {
					"featureType": "poi.park",
					"elementType": "labels.text.fill",
					"stylers": [
					  {
						"color": "#9e9e9e"
					  }
					]
				  },
				  {
					"featureType": "road",
					"elementType": "geometry",
					"stylers": [
					  {
						"color": "#ffffff"
					  }
					]
				  },
				  {
					"featureType": "road",
					"elementType": "geometry.fill",
					"stylers": [
					  {
						"color": "#c9d7f5"
					  }
					]
				  },
				  {
					"featureType": "road.arterial",
					"elementType": "labels.text.fill",
					"stylers": [
					  {
						"color": "#757575"
					  }
					]
				  },
				  {
					"featureType": "road.highway",
					"elementType": "geometry",
					"stylers": [
					  {
						"color": "#dadada"
					  }
					]
				  },
				  {
					"featureType": "road.highway",
					"elementType": "labels.text.fill",
					"stylers": [
					  {
						"color": "#616161"
					  }
					]
				  },
				  {
					"featureType": "road.local",
					"elementType": "labels.text.fill",
					"stylers": [
					  {
						"color": "#9e9e9e"
					  }
					]
				  },
				  {
					"featureType": "transit.line",
					"elementType": "geometry",
					"stylers": [
					  {
						"color": "#e5e5e5"
					  }
					]
				  },
				  {
					"featureType": "transit.station",
					"elementType": "geometry",
					"stylers": [
					  {
						"color": "#eeeeee"
					  }
					]
				  },
				  {
					"featureType": "water",
					"elementType": "geometry",
					"stylers": [
					  {
						"color": "#c9c9c9"
					  }
					]
				  },
				  {
					"featureType": "water",
					"elementType": "geometry.fill",
					"stylers": [
					  {
						"color": "#ffffff"
					  }
					]
				  }
				];


  showCables: () ->
    @cables = new google.maps.FusionTablesLayer
      query: {select: 'coordinates',from: @cables_table_id}
      styles: [{polylineOptions: {strokeOpacity: 1}}]
      suppressInfoWindows:true,
      styleId: 1
    @cables.setMap(@gmap)

  showLandingPoints: () ->
    @landing_points = new google.maps.FusionTablesLayer
      query: {select: 'coordinates',from: @landing_points_table_id}
      suppressInfoWindows:true
      styleId: 1
    @landing_points.setMap(@gmap)


  selectCable: (id, desc, is_map_clicked = false) ->
    # Cable Select Event
    @infoBox.close()
    @cables.setOptions
      styles: [
        { polylineOptions: {strokeOpacity: 0.1} }
        where: "id = '#{id}'", polylineOptions: { 
					#strokeColor: "#a81120", 
					strokeOpacity: 1.0}
      ]

    @landing_points.setQuery
      select: 'coordinates'
      from: @landing_points_table_id
      where: "id IN (#{("'#{d.id}'"for d in desc).join()})"
    @boundMap(desc)

  selectCountry: (cables, latlons) ->
    # Country Select Event
    @infoBox.close()
    @cables.setOptions
      styles: [
        { polylineOptions: { strokeOpacity: 0.1 }}
        where: "cable_id IN (#{("#{d.cable_id}"for d in cables).join()})", polylineOptions: { strokeOpacity: 1.0 }
      ]

    @landing_points.setQuery
      select: 'coordinates'
      from: @landing_points_table_id
      where: "cable_id IN (#{("#{d.cable_id}"for d in cables).join()})"

    @boundMap(latlons)

  selectRfs: (data) ->
    # RFS Select Event
    @infoBox.close()
    @cables.setOptions
      styles: [
        { polylineOptions: { strokeOpacity: 0.1 }}
        where: "rfs CONTAINS '#{data.rfs.toString()}'", polylineOptions: { strokeOpacity: 1.0 }
      ]
    @landing_points.setQuery
      select: 'coordinates'
      from: @landing_points_table_id
      where: "cable_id IN (#{("#{d.cable_id}"for d in data.cables).join()})"

  boundMap: (desc) ->
    bounds = new google.maps.LatLngBounds()
    for value in desc
      bounds.extend new google.maps.LatLng value.latlon.split(',')[0], value.latlon.split(',')[1]
    @gmap.fitBounds bounds
    if @gmap.getZoom() > 5
      @gmap.setZoom @gmap.getZoom() - 2

  selectLandingPoint: (name, latLng) ->
    # Landing Point Select Event
    @cables.setOptions({styles: [{ polylineOptions: {strokeOpacity: 1} }] });
    @landing_points.setQuery
      select: 'coordinates',
      from: @landing_points_table_id

    @infoBox.close()
    @gmap.panTo latLng
    @infoBox.setContent "<div class=\"infoBoxContent\"><div class=\"infoBoxPointer\"></div>#{name}</div>"
    @infoBox.setPosition latLng
    @infoBox.open @gmap

  resetMap: () ->
    @cables.setOptions({ styles: [{ polylineOptions: { strokeOpacity: 1 }} ] })
    @landing_points.setQuery({select: 'coordinates',from: @landing_points_table_id})
    @infoBox.close()

  resetBounds: () ->
    @gmap.setZoom 2
    @gmap.setCenter new google.maps.LatLng(30.0,-30.0)

  setEvents: () ->
    # Map Event
    google.maps.event.addListener @gmap, 'click', (event) =>
      # @analytics('Map', 'Click', 'On Map')
      jQuery(location).attr('href',"#/")

    # google.maps.event.addListener @gmap, 'zoom_changed', (event) =>
    #   console.log @gmap.getZoom()

    # Cable Event
    google.maps.event.addListener @cables, 'click', (event) =>
      # Cable Click Event?
      # @analytics('Cable', 'Click', event.row.id.value)
      jQuery(location).attr('href',"#/submarine-cable/#{event.row.id.value}")

    # LandingPoint Event
    google.maps.event.addListener @landing_points, 'click', (event) =>
      # Landing Point Click Event?
      # @analytics('Landing Point', 'Click', event.row.id.value)
      jQuery(location).attr('href',"#/landing-point/#{event.row.id.value}")

  isMobile: () ->
    try
      window.matchMedia("only screen and (max-width:736px)").matches
    catch error
      false

  analytics: (category, action, label) ->
    # _gaq.push(['_trackEvent', category, action, label]) if _gaq

  constructor: (@element, @config) ->
    @landing_points_table_id = @config.fusiontables_landingpoints_id
    @cables_table_id = @config.fusiontables_cable_id
    @creation_time = @config.creation_time
    @gmap = new google.maps.Map document.getElementById(@element), {
      zoom: if @isMobile() then 1 else 4,
      maptiks_id: "Submarine Cable Map",
      maxZoom: 8,
      minZoom: 2,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      styles: SubmarineCable.Map.mapStyles,
      center: new google.maps.LatLng(23.609944, 58.404624),
      streetViewControl: false,
      mapTypeControl: false,
      fullscreenControl: false,
      zoomControlOptions:
        position: google.maps.ControlPosition.LEFT_BOTTOM
      disableDefaultUI: if @isMobile() then true else false
    }
    @infoBox = new InfoBox({closeBoxURL:"",alignBottom:true,pixelOffset:new google.maps.Size(-60,-15)})
    @showCables()
    @showLandingPoints()
    @setEvents()
    return this

