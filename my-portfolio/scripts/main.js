document.addEventListener('DOMContentLoaded', function() {
    const sidebarToggles = document.querySelector('.sidebar-toggles');
    const toggleButtons = document.querySelectorAll('.sidebar-toggle');
    const sidebars = document.querySelectorAll('.sidebar');
    const hero = document.querySelector('.hero');

    function toggleSidebar(clickedToggle) {
        const targetSidebarName = clickedToggle.dataset.target;
        const targetSidebar = document.querySelector(`.sidebar[data-name="${targetSidebarName}"]`);

        const isOpening = !targetSidebar.classList.contains('active');

        // Close all sidebars and deactivate all toggles
        toggleButtons.forEach(toggle => toggle.classList.remove('active'));
        sidebars.forEach(sidebar => sidebar.classList.remove('active'));

        // If we're opening a sidebar, activate the clicked toggle and target sidebar
        if (isOpening) {
            clickedToggle.classList.add('active');
            targetSidebar.classList.add('active');
        }

        // Toggle the 'shifted' class based on whether any sidebar is now active
        const anySidebarActive = Array.from(sidebars).some(sidebar => sidebar.classList.contains('active'));
        hero.classList.toggle('shifted', anySidebarActive);
        sidebarToggles.classList.toggle('shifted', anySidebarActive);
    }

    toggleButtons.forEach(toggle => {
        toggle.addEventListener('click', () => toggleSidebar(toggle));
    });

    // Skill descriptions tooltip
    const skillItems = document.querySelectorAll('.skill-list li');
    const descriptionElement = document.createElement('div');
    descriptionElement.className = 'skill-description';
    document.body.appendChild(descriptionElement);

    function positionTooltip(e) {
        const tooltip = descriptionElement;
        let left = e.clientX;
        let top = e.clientY;

        const rect = tooltip.getBoundingClientRect();
        const viewportWidth = window.innerWidth || document.documentElement.clientWidth;
        const viewportHeight = window.innerHeight || document.documentElement.clientHeight;

        if (rect.right > viewportWidth) {
            left = e.clientX - rect.width;
        }
        if (rect.bottom > viewportHeight) {
            top = e.clientY - rect.height;
        }

        tooltip.style.left = `${left}px`;
        tooltip.style.top = `${top}px`;
    }

    skillItems.forEach(item => {
        item.addEventListener('mouseenter', function(e) {
            const description = this.getAttribute('data-description');
            if (description) {
                descriptionElement.textContent = description;
                descriptionElement.style.display = 'block';
                positionTooltip(e);
            }
        });

        item.addEventListener('mousemove', positionTooltip);

        item.addEventListener('mouseleave', () => {
            descriptionElement.style.display = 'none';
        });
    });

    console.log('Script loaded');

    const projectCards = document.querySelectorAll('.project-card');

    projectCards.forEach(card => {
        const header = card.querySelector('.project-header');
        header.addEventListener('click', () => {
            card.classList.toggle('active');
        });
    });
});
