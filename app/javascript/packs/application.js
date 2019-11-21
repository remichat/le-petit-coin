import "bootstrap";
import AOS from 'aos';
import 'aos/dist/aos.css';
import { loadDynamicBannerText } from '../components/banner';
import { toiletTypeToSelect } from '../components/select';
import { setDatePicker } from "../plugins/flatpickr"
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
loadDynamicBannerText();
toiletTypeToSelect();
setDatePicker();
AOS.init();
initMapbox();
