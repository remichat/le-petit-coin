import $ from 'jquery';
import select2 from 'select2';

const toiletTypeToSelect = () => {
  $(document).ready(function() {
      $('#toilet_toilet_type').select2();
  });
};

export { toiletTypeToSelect };
