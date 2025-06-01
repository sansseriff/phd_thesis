## Results

For the full PPM decoding of both the 10&#160;GHz and 20&#160;GHz datasets, the constructed time tag $\tilde{t}_A$ is first used to find an initial estimate for the correct time bin for each PPM frame. Then, the GMM analysis is performed for nearby time bins to create a correction to the initial estimate. For each of the 17 mean photon numbers for which we test PPM decoding, the GMM model is derived from fitting to the measurements from the preamble sequence of pulses in the $i = 0$ time slot. Fig. [1](#fig:decoding_20GHz) a shows the decoding success and error rate for the 20&#160;GHz demonstration, and Fig. [1](#fig:decoding_20GHz) b shows the decoded image at 3 particular mean photon numbers indicated in Fig. [1](#fig:decoding_20GHz) a. As shown in Fig. [1](#fig:decoding_20GHz) b and c, the photon-number groupings of different time bins somewhat interleave with each other. Error rates with the GMM correction are therefore moderately lower because it has better knowledge of the complex shape of the decision boundary between photon clusters in different time bins.

<figure markdown> 
    <a name='fig:decoding_20GHz'></a> 
    <img alt="fig:decoding_20GHz" style="width: 100%; margin: auto;" src="../figs/ppm_decoding_20GHz_light.svg#only-light" >
    <img alt="fig:decoding_20GHz" style="width: 100%; margin: auto;" src="../figs/ppm_decoding_20GHz_dark.svg#only-dark" > 
    <figcaption markdown> Figure 1: **PPM decoding performance at 20&#160;GHz** a) ratios pulses making up the dataset that are missing, decoded correctly, or decoded incorrectly. The use of the GMM model reduces the the decoding error rate by 2 to 19% (red percentages) for the range of mean photon numbers for which the errors are most statistically significant as shown by the dashed red line. b) decoded images for three particular mean photon numbers, with the rate of correct bits specified in Mbits/s. Since no error correction is performed, these are just visual representations of the error rates shown above. c) & d) Scatter plots showing the location of timing measurements $t_A, t_B$ from the PPM decoding. For each $t_A,t_B$ pair, the correct timing offset $i*50~ps$ is subtracted off to form the purple distribution. Grey distributions are copies of the purple data translated by $50~ps$, included to show how data from different time bins and photon clusters overlaps. Green (red) points highlight events that switched from incorrectly (correctly) decoded to correctly (incorrectly) decoded with application of the GMM method after the SLOPE method.</figcaption>
    </figure>

## Photon number discrimination

The GMM used requires a specified number of Gaussians to fit the whole distributions with no constraints on the number of Gaussians assigned to certain clusters. Therefore, for photon number discrimination, a method for grouping the Gaussians into sets that describe specific photon number clusters is needed. We start with data from a moderate mean photon number which displays clusters for photon numbers from 1 to 5+. We specify a number of Gaussians to model this distribution in the range of 15 to 20, which ensures that each cluster is faithfully modelled by the sum of a few Gaussians. We observe a minimal improvement the the model accuracy if more Gaussians are used.

Then, we compute the symmetric Kullback–Leibler (KL) divergence between all pairs of Gaussians and represent this data in an adjacency matrix. The KL divergence is a measure of the similarity between two probability distributions, and may be computed from the respective means and covariance matrices of each Gaussian component.

??? note
    Upon further study, it appears a modification to the KL divergence called the Jensen-Shannon divergence may be more appropriate for this application. The JS divergence is a symmetrized and smoothed version of the KL divergence.

    $$
    \operatorname{JSD}(P \| Q)=\frac{1}{2} D(P \| M)+\frac{1}{2} D(Q \| M),
    $$

    where $M=\frac{1}{2}(P+Q)$ is a mixture disbribution of $P$ and $Q$, and and $D$ is the KL divergence.

    For eventual publication, this metric may be adopted instead.

The adjacency matrix can be thought of as a undirected graph where each node represents a Gaussian component and each edge represents the symmetric KL divergence between two Gaussians. We then use a community detection algorithm to group the Gaussians into sets that correspond to the photon number clusters. We use the Louvain method [@Blondel2008] for this purpose, implemented in the NetworkX python package.

Fig. [2](#fig:pnr_groupings) a shows the result of dividing the Gaussian components into groups $C_j$ that represent particular photon numbers $j$. As shown, this is done for a moderate mean photon number ($\mu=3.47$) for which all the clusters $|1\rangle$ through $|5+\rangle$ in the modelled dataset are present with non-negligible statistics. With this, the GMM model can be tuned to best represent the response of the detector at other mean photon numbers as well, by normalizing and scaling the relative amplitudes of each group $C_j$. Fig. [2](#fig:pnr_groupings) b a shows photon number attribution using this model. Each event from the PPM dataset is assigned a most probable photon number based on the GMM model and its location in the $t_A, t_B$ plane. As indicated by the black dashed ellipse, misattribution can occur bewteen $|2\rangle$ events in a time slot $t$ and $|3\rangle$ events in the next time slot $t+1$. This is because the $|2\rangle$ and $|3\rangle$ clusters overlap in the $t_A, t_B$ plane for the 20&#160;GHz dataset. This is overlap is much less pronounced for the 10&#160;GHz dataset. Such ambiguities fundamentally limit the minimum length time bin length needed for simultaneous photon arrival and photon number attribution. If the correct time-slot is known a priori and photon number attribution is only done for ‘correct’ arrival time events, then the photon number assignment is more accurate as shown in Fig. [2](#fig:pnr_groupings) c.

<figure markdown> 
    <a name='fig:pnr_groupings'></a> 
    <img alt="fig:pnr_groupings" style="width: 100%; margin: auto;" src="../figs/pnr_resolved_arrival_time_groupings_light.svg#only-light" >
    <img alt="fig:pnr_groupings" style="width: 100%; margin: auto;" src="../figs/pnr_resolved_arrival_time_groupings_dark.svg#only-dark" > 
    <figcaption markdown> Figure 2: **Photon number attribution** a) Ellipses represent Gaussians whose sum models the detector response for specific mean photon numbers. Ellipse opacity represents the Gaussian weight in the mixture. b) Photon number attribution with the 20&#160;GHz dataset. Grey distributions are copies of the colored data for timeslot $i$ translated by $50~ps$ to show overlap c) Photon numbers assignments only for events that fall into the correct time bin.</figcaption>
    </figure>

<script>
            function resizeIframe(iframe) {
                iframe.style.height = iframe.contentWindow.document.documentElement.scrollHeight + 'px';
                iframe.style.width = iframe.contentWindow.document.documentElement.scrollWidth + 'px';
            }
</script>

<style>
iframe {
            display: block;
            width: 100%;
            border: none;
        }
</style>

???+ info
    <figure markdown>
    <a name='fig:interactive_pnr_groupings'></a>
    <iframe src="../code/normalized_photon_groupings.html" onload="resizeIframe(this)" scrolling="no"></iframe>
    <figcaption markdown>A 3D representation of the photon number groupings built from the Gaussian mixture models. The scaling of each grouping match a mean photon number of $\mu = 3.48$. This is acts as an alternative to Fig. [2](#fig:pnr_groupings) a. The 3D plot is interactive, and can be rotated and zoomed. </figcaption>
    </figure>

With measurements of photon number for each PPM event, the relative statistics of these events and vacuum events can be compared with the expected poisson statistics. Fig. [3](#fig:photon_statistics) shows the results of this comparison for the 20&#160;GHz dataset. The measured statistics are in good agreement with the expected poisson statistics for the range of mean photon numbers tested.

<figure markdown> 
    <a name='fig:photon_statistics'></a> 
    <img alt="fig:photon_statistics" style="width: 100%; margin: auto;" src="../figs/pnr_stats_light.svg#only-light" >
    <img alt="fig:photon_statistics" style="width: 100%; margin: auto;" src="../figs/pnr_stats_dark.svg#only-dark" > 
    <figcaption markdown> Figure 3: **Photon number statistics** Measured ( markers $M_j$ ) photon statistics overlayed with expected poisson statistics ( lines $P_j$ ) for the range of photon numbers tested. a) uses log-log scale, b) uses linear scale.</figcaption>
    </figure>

<!-- to reactively change slider: -->

<!-- Bokeh.embed.index.p3095.layout.children._items[0].data.child_models[1].value = 200 -->
