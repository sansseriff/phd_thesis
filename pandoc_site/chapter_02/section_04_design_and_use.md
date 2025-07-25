## Design

A modified translatable 0.8 K stage was designed at JPL. It positioned the 0.8 K stage very close to the 4 K stage above, and was attached to the 0.8 K pot of the sorption cryocooler via a copper braid. Bendable carbon fiber rods connected the 0.8 K stage to a 4 K mount through which an optical stack of filter and lens could be positioned.

A single mode fiber was used to image onto the detector using two f = 18.75 mm lenses. One lens collimated light from an optical fiber face outside the cryostat (Photon Spot), and the other focused light onto the detector inside [@Bellei:16]. In the collimated region between, the beam passed through the short-pass filter stack (Fig. [1](#fig:setup) a). One of the short-pass filters was angled to avoid ghosting or etalon effects. The 40 K radiation shield and outer cryostat housing were fitted with anti-reflection coated BK7 windows. The filters were spring loaded to prevent cracking at low temperatures. To minimize effects of stray light, the interior of the 4 K shield was painted with mid-IR absorbing paint (Aeroglaze Z306) as shown in Fig. [1](#fig:setup) c [@Persky1999], while gaps between filters and the windows were covered with metal tape.

<figure markdown> 
    <a name='fig:setup'></a> 
    <img alt="fig:setup" style="width: 100%; margin: auto;" src="../figs/dcrmin_layout_light.png#only-light" >
    <img alt="fig:setup" style="width: 100%; margin: auto;" src="../figs/dcrmin_layout_dark.png#only-dark" > 
    <figcaption markdown> Figure 1: **Full system layout** a) System hardware. ASPH: aspheric lens, (Edmund Optics #47-729) SP1 & SP2: custom short-pass filters (semrock), BP: band-pass filter, (Semrock NIR01-1550/3-25), BK7: glass windows, SMF: Single-mode fiber, PEL: Peltier element, LC: Liquid cooling block b) Lens tube structure used in the fridge that holds the cryogenic lens and 2 short pass filters. c) Radiation shield painted with Mid-IR absorbing paint</figcaption>
    </figure>

The system was based on 1-inch optics, although the f = 18.75 mm lenses leads to a $1/e^2$ intensity diameter of about 5 mm in the collimated region. To reduce the larger-than-required numerical aperture of the system, painted 8 mm apertures (Acktar Spectral Black) were added in the collimated region. These are large enough to allow minor alignment adjustments — by translating the exterior collimating lens — without vignetting. Upon discovering that the short-pass filters alone did not provide leading dark-count-rate performance, we incorporated a bandpass filter mounted in the 4 K radiation shield optical port.

<!-- \begin{figure}[htbp]
\centering
\centering\includegraphics[width=\linewidth]{DataFigure_6.pdf}
\caption{ \small a) Simulated photon flux at various temperatures with and without the 1550 nm bandpass filter (BP). b) Normalized photon count rate (PCR) and jitter measurements c) DCR, and calculated figure of merit $H$ versus bias current for both fiber-coupled and free space coupled configurations.}
\label{fig:false-color}
\end{figure}
![**Low Dark Count Rate Project Results** a) Simulated photon flux at various temperatures with and without the 1550 nm bandpass filter (BP). b) Normalized photon count rate (PCR) and jitter measurements c) DCR, and calculated figure of merit $H$ versus bias current for both fiber-coupled and free space coupled configurations.](./figs/DataFigure_6.svg){#fig:dcrmin_data short-caption="Low Dark Count Rate Project Results." path="chapter_02"} -->

## Alignment

The cryo-lens and 0.8 K optical stage had to align using a configuration that worked whether the fridge was open or closed. The x-bracket design, supporting the 0.8 K stage, accommodated optical posts at the same positions as the standoffs on the cryostat’s exterior can. Fig. [2](#fig:optics_alignment) a shows the free-space optics attached to the internals of the cryostat. This included fiber collimation optics and a beamsplitter/camera module that could be removed to achieve maximum coupling efficiency. The camera images the plane of the detector, and is able to observe features of the nanowire wafer (like the detector and impedance matching taper barely visible in the camera view in Fig. [2](#fig:optics_alignment) b). Adding a bandpass filter to the system blocked any broadband light source used for detector imaging. Consequently, we achieved detector alignment by iteratively: de-focusing the source laser to flood illuminate the detector, identifying the detector’s location in the camera view and marking it, and finally refocusing the source laser onto the detector and reducing it to a single photon level to measure efficiency.

<figure markdown> 
    <a name='fig:optics_alignment'></a> 
    <img alt="fig:optics_alignment" style="width: 100%; margin: auto;" src="../figs/dcrmin_alignment_light.png#only-light" >
    <img alt="fig:optics_alignment" style="width: 100%; margin: auto;" src="../figs/dcrmin_alignment_dark.png#only-dark" > 
    <figcaption markdown> Figure 2: **Method of optical alignment** a) Configuration used for checking alignment of the cryo-lens with the fridge open. b) Diagram of the optics in the same configuration. The 4 K radiation shield (not shown in full) supports 2 of the short pass filters and bandpass filter (pink).</figcaption>
    </figure>
