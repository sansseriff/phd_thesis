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
document$.subscribe(function() {
  const images = document.querySelectorAll('img[alt^="fig:"]');


  images.forEach(image => {
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
      if (aspectRatio > 1.5 || window.innerWidth <= 1300) {
        imageWithCaption.style.flexDirection = 'column';
        figcaption.style.marginTop = '1rem';
        figcaption.style.width = "50rem";
        if (window.innerWidth <= 1300) {
          figcaption.style.width = "100%";
        }
      } else {
        imageWithCaption.style.flexDirection = 'row-reverse';
        figcaption.style.marginRight = '2rem';
        figcaption.style.width = '22rem';
      }

      document.body.appendChild(modal);
    });
  });
});




