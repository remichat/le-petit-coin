import "bootstrap";
import AOS from 'aos';
import 'aos/dist/aos.css';
import { loadDynamicBannerText } from '../components/banner';
import { toiletTypeToSelect } from '../components/select';
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { setDatePicker } from "../plugins/flatpickr";
import { setNotificationsUpdates } from "../components/badge";
import { closeNotifListener } from "../components/notification"

loadDynamicBannerText();
toiletTypeToSelect();
setDatePicker();
AOS.init();
initMapbox();
setNotificationsUpdates();
closeNotifListener();
