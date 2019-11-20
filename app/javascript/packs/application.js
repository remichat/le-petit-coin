import "bootstrap";
import AOS from 'aos';
import 'aos/dist/aos.css';
import { loadDynamicBannerText } from '../components/banner';
import { toiletTypeToSelect } from '../components/select';
import { setDatePicker } from "../plugins/flatpickr"
loadDynamicBannerText();
toiletTypeToSelect();
setDatePicker();
AOS.init();
