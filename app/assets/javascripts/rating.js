const form = document.forms["sendRatingMovie"]

function setRating() {
    const head = getHead();
    const data = getData();

    fetch(head.action, {method: 'POST', body: data})
        .then((response) => {
            if (response.ok) {
                form.innerText = 'You have successfully voted'
            } else {
                throw Error('Voting error')
            }
        })
        .catch((error) => {
            form.innerText = error.message
        })
}

function getHead() {
    return {
        action: form.attributes['action'].value
    };
}

function getData() {
    const f = new FormData();
    f.append('authenticity_token', form['authenticity_token'].value)
    f.append('value', form['value'].value)
    return f;
}