import './bootstrap';

import Alpine from 'alpinejs';

window.Alpine = Alpine;

Alpine.start();

import * as FilePond from 'filepond';

window.FilePond = FilePond;
// resources/js/app.js

import ClassicEditor from '@ckeditor/ckeditor5-build-classic';

document.addEventListener('DOMContentLoaded', function() {
    const messageField = document.querySelector('#message');
    if (messageField) {
        ClassicEditor
            .create(messageField)
            .catch(error => {
                console.error('There was a problem initializing the editor.', error);
            });
    }
});
