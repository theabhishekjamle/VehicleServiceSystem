const button = document.getElementById('floating-button');
    let isDragging = false;
    let offset = { x: 0, y: 0 };

    button.addEventListener('mousedown', (e) => {
      isDragging = true;
      offset.x = e.clientX - button.getBoundingClientRect().left;
      offset.y = e.clientY - button.getBoundingClientRect().top;
      document.body.style.userSelect = 'none';
    });

    document.addEventListener('mousemove', (e) => {
      if (isDragging) {
        button.style.left = `${e.clientX - offset.x}px`;
        button.style.top = `${e.clientY - offset.y}px`;
      }
    });

    document.addEventListener('mouseup', () => {
      isDragging = false;
      document.body.style.userSelect = '';
    });


