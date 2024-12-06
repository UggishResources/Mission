window.addEventListener('message', function(event) {
    if (event.data.action == 'open') {
        document.getElementById('ui-mission').style.display = 'block';
    }
});


// Close UI when you press close.
document.getElementById('close-ui').addEventListener('click', function() {
    closeUI();
});

// Funktion to close UI
function closeUI() {
    fetch(`https://${GetParentResourceName()}/closeUI`, {
        method: 'POST', // 
    }).then(response => response.json()).then(data => {
        console.log('Close UI Response:', data);
    }).catch(error => {
        console.error('Error:', error);
    });

    document.getElementById('ui-mission').style.display = 'none';
}

// Item 1
document.getElementById('mission-item1').addEventListener('click', function() {
    fetch(`https://${GetParentResourceName()}/mission1`, {
        method: 'POST'
    }).then(response => response.json()).then(data => {
        console.log('Success:', data);
    }).catch(error => {
        console.error('Error:', error);
    });
});

// Item 2
document.getElementById('mission-item2').addEventListener('click', function() {
    fetch(`https://${GetParentResourceName()}/mission2`, {
        method: 'POST'
    }).then(response => response.json()).then(data => {
        console.log('Success:', data);
    }).catch(error => {
        console.error('Error:', error);
    });
});

// Item 3
document.getElementById('mission-item3').addEventListener('click', function() {
    fetch(`https://${GetParentResourceName()}/mission3`, {
        method: 'POST'
    }).then(response => response.json()).then(data => {
        console.log('Success:', data);
    }).catch(error => {
        console.error('Error:', error);
    });
});

// Item 4
document.getElementById('mission-item4').addEventListener('click', function() {
    fetch(`https://${GetParentResourceName()}/mission4`, {
        method: 'POST'
    }).then(response => response.json()).then(data => {
        console.log('Success:', data);
    }).catch(error => {
        console.error('Error:', error);
    });
});