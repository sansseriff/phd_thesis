## Results

For the full PPM decoding of both the 10~GHz and 20~GHz datasets, the constructed timetagg $\tilde{t_A}$ is first used to find an initial estimate for the correct time bin for each PPM frame. Then, the GMM analysis is performed for nearby time bins to create a correction to the initial estimate. For each of the 17 mean photon numbers for which we test PPM decoding, the GMM model is derived from fitting to the measurements from the preamble sequence of pulses in the i=0 time slot. @fig:decoding_20GHz a shows the decoding success and error rate for the 20~GHz demonstration, and 
@fig:decoding_20GHz b shows the decoded image at 3 particular mean photon numbers indicated in @fig:decoding_20GHz a. As shown @fig:decoding_20GHz b and c, the photon number groupings of different time bins somewhat interleave with each other. Error rates with the GMM correction are therefore moderately lower, as it has better knowledge of the complex shape of the decision boundary between photon clusters in different time bins. 



![**PPM decoding performance at 20~GHz** a) ratios pulses making up the dataset that are missing, decoded correctly, or decoded incorrectly. The use of the GMM model reduces the the decoding error rate by 2 to 19% (red percentages) for the range of mean photon numbers for which the errors are most statistically significant as shown by the dashed red line. b) decoded images for three particular mean photon numbers. Since no error correction is performed, these are just visual representations of the error rates shown above. b) & c) Scatter plots showing the location of timing measurements $t_A, t_B$ from the PPM decoding. For each $t_A,t_B$ pair, the correct timing offset $i*50~ps$ is subtracted off to form the purple distribution. Grey distributions are copies of the purple data translated by $50~ps$, included to show how data from different time bins and photon clusters overlaps. Green (red) points highlight events that switched from incorrectly (correctly) decoded to correctly (incorrectly) decoded with application of the GMM method after the SLOPE method.](./figs/ppm_decoding_20GHz_light.svg){#fig:decoding_20GHz short-caption='PPM decoding performance at 20~GHz' width=100% path="chapter_04"}

## Photon number Discrimination

The GMM used requires a specified number of gaussians to fit the whole distributions with no constraints on the number of gaussians assigned to certain clusters. Therefore, for photon number discrimination, a method for grouping the gaussians into sets that describe specific photon number clusters is needed. We start with data from a moderate mean photon number which displays clusters for photon numbers from 1 to 5+. We specify a number of gaussians to model this distribution in the range of 15 to 20, which ensures that each cluster is faithfully modelled by the sum of a few gaussians. We observe a minimal improvement the the model accuracy if more gaussians are used. 

Then, we compute the symmetric Kullback–Leibler (KL) divergence divergence between all pairs of gaussians and represent this data in an adjacency matrix. The KL divergence is a measure of the similarity between two probability distributions, and may be computed from the respective means and covariance matrices of each gaussian component. 

```{=html}
??? note
    Upon further study, it appears a modification to the KL divergence called the Jensen-Shannon divergence may be more appropriate for this application. The JS divergence is a symmetrized and smoothed version of the KL divergence. 

    $$
    \operatorname{JSD}(P \| Q)=\frac{1}{2} D(P \| M)+\frac{1}{2} D(Q \| M),
    $$

    where $M=\frac{1}{2}(P+Q)$ is a mixture disbribution of $P$ and $Q$, and and $D$ is the KL divergence.

    For eventual publication, this metric may be adopted instead. 
```

The adjacency matrix can be thought of as a undirected graph where each node represents a gaussian component and each edge represents the symmetric KL divergence between two nodes. We then use a community detection algorithm to group the gaussians into sets that correspond to the photon number clusters. We use the Louvain method [@Blondel2008] for this purpose, implemented in the NetworkX python package. 



<!-- to reactively change slider: -->
<!-- Bokeh.embed.index.p3095.layout.children._items[0].data.child_models[1].value = 200 -->