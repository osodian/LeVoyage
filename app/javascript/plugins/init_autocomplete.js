import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('trip_destination');
  if (destinationInput) {
    places({ container: destinationInput });
  }
};

export { initAutocomplete };
