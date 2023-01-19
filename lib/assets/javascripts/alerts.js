function showAlert(notice, type = 'success') {
  $.bootstrapGrowl(notice, {
    type: type, // (null, 'info', 'danger', 'success')
    align: "right", // ('left', 'right', or 'center')
    allow_dismiss: true, // If true then will display a cross to close the popup.
    stackup_spacing: 10, // spacing between consecutively stacked growls.
  });
}
