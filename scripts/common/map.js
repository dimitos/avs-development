window.initMap = () => {
    ymaps.ready(function () {
        if($('#map').length > 0) {
            let myMap = new ymaps.Map("map", {
                center: [56.832076, 60.573734],
                zoom: 12.5,
            }, {
                suppressMapOpenBlock: true, //убирает кнопку КАК ДОБРАТЬСЯ
            });

            // let myPlacemark = new ymaps.Placemark(
            //     [44.511797, 34.215688],
            //     { hintContent: "ЖК" },
            //     {
            //         iconLayout: "default#image",
            //         iconImageHref: "img/icon-placemark.png",
            //         iconImageSize: [30, 59],
            //         iconImageOffset: [-20, -60]
            //     }
            // );

            // myMap.geoObjects.add(myPlacemark);
            myMap.behaviors.disable("scrollZoom");
        }


        if($('#contacts-map').length > 0) {
            let myMap2 = new ymaps.Map("contacts-map", {
                center: [56.836706, 60.529447],
                zoom: 15,
            }, {
                suppressMapOpenBlock: true, //убирает кнопку КАК ДОБРАТЬСЯ
            });

            let myPlacemark1 = new ymaps.Placemark(
                [56.831863, 60.613977],
                { hintContent: "Компании «AVS Девелопмент»" },
                {
                    iconLayout: "default#image",
                    iconImageHref: "img/svg/marker1.svg",
                    iconImageSize: [40, 40],
                    iconImageOffset: [-40, -20]
                }
            );

            myMap2.geoObjects.add(myPlacemark1);
            // myMap.behaviors.disable("scrollZoom");
        }

        if($('#object-map').length > 0) {
            let myMap3 = new ymaps.Map("object-map", {
                center: [56.882953, 60.794000],
                zoom: 14,
            }, {
                suppressMapOpenBlock: true, //убирает кнопку КАК ДОБРАТЬСЯ
            });

            let myPlacemark2 = new ymaps.Placemark(
                [56.882953, 60.794000],
                { hintContent: "Компании «AVS Девелопмент»" },
                {
                    iconLayout: "default#image",
                    iconImageHref: "img/svg/contacts-map-marker.svg",
                    iconImageSize: [40, 40],
                    iconImageOffset: [-40, -20]
                }
            );

            myMap3.geoObjects.add(myPlacemark2);
            // myMap.behaviors.disable("scrollZoom");
        }

        if($('#map-radar').length > 0) {
            let modMap = new ymaps.Map("map-radar", {
                center: [56.832544, 60.517117],
                zoom: 13,
            }, {
                suppressMapOpenBlock: true, //убирает кнопку КАК ДОБРАТЬСЯ
            });

            let modMapPlacemark1 = new ymaps.Placemark(
                [56.857399, 60.526794],
                { hintContent: "Компания «AVS Девелопмент»" },
                {
                    iconLayout: "default#image",
                    iconImageHref: "img/svg/marker1.svg",
                    iconImageSize: [50, 50],
                    iconImageOffset: [-40, -20]
                }
            );

            let modMapPlacemark2 = new ymaps.Placemark(
                [56.840743, 60.567021],
                { hintContent: "Компания «AVS Девелопмент»" },
                {
                    iconLayout: "default#image",
                    iconImageHref: "img/svg/marker2.svg",
                    iconImageSize: [50, 50],
                    iconImageOffset: [-40, -20]
                }
            );

            let modMapPlacemark3 = new ymaps.Placemark(
                [56.827400, 60.559379],
                { hintContent: "Компания «AVS Девелопмент»" },
                {
                    iconLayout: "default#image",
                    iconImageHref: "img/svg/marker4.svg",
                    iconImageSize: [50, 50],
                    iconImageOffset: [-40, -20]
                }
            );

            let modMapPlacemark4 = new ymaps.Placemark(
                [56.827104, 60.502274],
                { hintContent: "Компании «AVS Девелопмент»" },
                {
                    iconLayout: "default#image",
                    iconImageHref: "img/svg/marker3.svg",
                    iconImageSize: [50, 50],
                    iconImageOffset: [-40, -20]
                }
            );

            modMap.geoObjects.add(modMapPlacemark1);
            modMap.geoObjects.add(modMapPlacemark2);
            modMap.geoObjects.add(modMapPlacemark3);
            modMap.geoObjects.add(modMapPlacemark4);

            modMap.behaviors.disable("scrollZoom");
        }
    });

}
