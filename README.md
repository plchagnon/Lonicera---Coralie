# Response of *Lonicera maackii* to soil chemistry and fungal communities. 

This project aims at disentangling the relative contribution of soil physico-chemistry and fungal communities in driving *Lonicera maackii* performance. In 2019, we sampled 50 soil inocula, from 5 distinct sites, and grew *Lonicera maackii* in these inocula in a growth chamber, for 12 weeks. 

We measured shoot dry mass, root length and average diameter, and root fungal colonization as response variables.

In parallel, for each inoculum, we measured soil physico-chemistry and extract DNA to characterize fungal community structure using Illumina MiSeq technology (PE250bp), with amplicons targeting the ITS1 region. Data are provided as follows:

1. Soil properties are included in the file ``XYZ.XYZ``

2. Soil fungal community structure can be found in the file ``XYZ.txt``, where rows are inocula and number within each cell are the number of reads found in each inoculum for the corresponding column (fungal sequence variant). We also provide raw sequence files within the sequence read archives (SRA) under the BioProject # XYZ. The SRR numbers associated with all samples can be found in our file ``SRRs.txt``.

3. *Lonicera* growth can be found in the file ``XYZ.XYZ``


<br>

*EXPLAIN ALL METADATA FOR THE RESPECTIVE FILES. E.g., explain the protocol used for each soil property, the way each Lonicera growth response variable was measured, and the protocol for the sequencing...*

<br>
<br>

## Soil properties : ``XYZ.XYZ``
------------

[.................]



<br>
<br>

## Soil fungal communities : ``XYZ.txt``
------------

[.................]

<br>
<br>

## *Lonicera* growth response : ``XYZ.XYZ``
------------

[.................]

<br>
<br>

Below, we outline data analyses allowing us to link soil properties and fungal communities to *Lonicera* performance, while taking into account site identity.

<br>
<br>

## Bioinformatics
---------------
Before proceeding with statistical analyses, we first processed raw ``.fastq`` sequence files using the R package ``dada2``. First, we quality-filtered sequences in order to [.........]

```R
[...............]
```

Then, we proceeded with paired-end merging:

```R
[...............]
```

Next, we removed potential chimeras:

```R
[...............]

```
Finally, we assigned taxonomy using the UNITE database, version **XYZ**. Because of the size of the database, we had to submit this last job to a supercomputer using the following SLURM job:

```sh

```

To correct for uneven sequencing depth per sample, we conducted sequence rarefaction in R:

```r

```

<br>
<br>

##



