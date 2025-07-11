//I know doing this all in javascipt only is terrible. I'm sorry.
// The css is in stylesheets/extra.css

// this is the modal dom created:

// <div class="modal">
//  <div class="backdrop">
//    <div class="image-container">
//        <div class="direct-background">
//            <img class="modal-image">
//            <figcaption-modal></figcaption-modal>
//        </div>
//    </div>
//  </div>
//</div>
document$.subscribe(function () {
  // Remove md-footer-meta div (one-off)
  const footerMeta = document.querySelector('.md-footer-meta');
  if (footerMeta) {
    footerMeta.remove();
  }

  const images = document.querySelectorAll('img[alt^="fig:"]');


  images.forEach(image => {
    let timerId;


    const imageContainer = image.parentNode

    imageContainer.addEventListener('mouseenter', (event) => {
  timerId = setTimeout(() => {
    const img = document.createElement('img');
    console.log('added')
    img.id = 'overlay'
    img.src = '/javascripts/zoom-white.svg';
    img.style.position = 'fixed';
    
    // Use imageContainer positioning instead of trying to find the specific image
    const rect = imageContainer.getBoundingClientRect();
    img.style.top = `${rect.top + Math.round(0.5 * rect.height)}px`;
    img.style.left = `${rect.left + Math.round(0.5 * rect.width)}px`;
    
    img.style.width = "250px";
    img.style.height = "250px";
    img.style.opacity = '0';
    img.style.transform = 'translate(-50%, -50%)';
    img.style.transition = 'opacity 0.5s';
    img.style.pointerEvents = 'none';
    img.style.mixBlendMode = "difference";
    img.style.zIndex = "0";
    
    document.body.appendChild(img);
    
    setTimeout(() => {
      img.style.opacity = '0.06';
    }, 10);

    img.addEventListener('mouseenter', (event) => {
      clearTimeout(timerId);
      event.stopPropagation();
    });
  }, 400);
});

imageContainer.addEventListener('mouseleave', () => {
  clearTimeout(timerId);
  const newNode = document.body.querySelector('#overlay'); // Changed selector
  if (newNode) {
    document.body.removeChild(newNode); // Changed from imageContainer
  }
});



    image.addEventListener('click', event => {
      event.preventDefault();

      const modal = document.createElement('div');
      modal.classList.add('modal');

      const bg = document.createElement('div');
      const backdrop = document.createElement('div');
      bg.classList.add('bg');
      backdrop.classList.add('backdrop');
      backdrop.addEventListener('click', () => {
        modal.remove();
      });

      const imageContainer = document.createElement('div');
      imageContainer.classList.add('image-container');

      const modalImage = document.createElement('img');
      modalImage.src = event.target.src;

      // Get the <figcaption> inner text
      const figcaptionHtml = event.target.parentNode.nextElementSibling.innerHTML;
      // console.log(figcaptionHtml);


      // document.body.appendChild(modal);
      const imageWithCaption = document.createElement('div');
      imageWithCaption.classList.add('image-with-caption');
      imageWithCaption.appendChild(modalImage);

      const figcaption = document.createElement('div');
      figcaption.classList.add('figcaption-modal');
      figcaption.innerHTML = figcaptionHtml;
      imageWithCaption.appendChild(figcaption);

      const directBackground = document.createElement('div');
      directBackground.classList.add('direct-background');
      directBackground.appendChild(imageWithCaption);

      imageContainer.appendChild(directBackground);
      backdrop.appendChild(imageContainer);
      modal.appendChild(backdrop);
      modal.appendChild(bg);

      // Check the aspect ratio of the image
      const aspectRatio = modalImage.naturalWidth / modalImage.naturalHeight;
      const windowAspectRatio = window.innerWidth / window.innerHeight;
      
      // Calculate available space (accounting for margins/padding)
      const availableWidth = window.innerWidth * 0.9; // 90% of window width
      const availableHeight = window.innerHeight * 0.9; // 90% of window height
      
      // Estimate caption height (approximate based on layout)
      const estimatedCaptionHeight = window.innerWidth <= 1300 ? 100 : 150;
      const availableImageHeight = availableHeight - estimatedCaptionHeight;
      
      console.log(aspectRatio, windowAspectRatio);
      
      if (aspectRatio > 1.6 || window.innerWidth <= 1300) {
        imageWithCaption.style.flexDirection = 'column';
        figcaption.style.marginTop = '1rem';
        figcaption.style.width = "50rem";
        if (window.innerWidth <= 1300) {
          figcaption.style.width = "100%";
        }
        
        // For column layout, check if image height would exceed available space
        const maxImageWidth = Math.min(availableWidth, modalImage.naturalWidth);
        const scaledImageHeight = maxImageWidth / aspectRatio;
        
        if (scaledImageHeight > availableImageHeight) {
          // Constrain by height instead
          modalImage.style.maxHeight = `${availableImageHeight}px`;
          modalImage.style.maxWidth = 'none';
          modalImage.style.width = 'auto';
        }
      } else {
        imageWithCaption.style.flexDirection = 'row-reverse';
        figcaption.style.marginRight = '2rem';
        figcaption.style.width = '22rem';
        
        // For row layout, account for caption width
        const availableImageWidth = availableWidth - 350; // ~22rem + margins
        const maxImageWidth = Math.min(availableImageWidth, modalImage.naturalWidth);
        const scaledImageHeight = maxImageWidth / aspectRatio;
        
        if (scaledImageHeight > availableHeight) {
          // Constrain by height
          modalImage.style.maxHeight = `${availableHeight}px`;
          modalImage.style.maxWidth = 'none';
          modalImage.style.width = 'auto';
        }
      }

      document.body.appendChild(modal);
    });
  });
});




