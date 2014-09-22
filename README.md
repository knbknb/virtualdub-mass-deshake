virtualdub-mass-deshake
=======================

*Deshaking video* is a common task for the hobbyist photographer. Nearly all sports videos shot on digital cameras,  videos need to be deshaked to make them viewable. This repo contains a script for helping "prosumers" doing this.

<h3>Requirements:</h3>

  - Ubuntu Linux as Operating System
  - wine 1.x installed into Ubuntu
  - Virtualdub > 1.6 installed into wine
  - Deshaker Plugin installed into Virtualdub
  - Experience with the deshaker plugin
  - Virtualdub.exe must be on the wine Path
  - There needs to be a .vdscript file present with the filter settings saved away properly.


<h3> Two scripts for mass-deshaking videos on Linux, using the freeware programs wine and  VirtualDub  </h3>
 Put all your *.mp4 or *.avi files in a single directory.

VirtualDub will attempt to process all files in that directory. Using a bash command line and the .vdscript file provided in this repo, you'll specify the directory name and the suffix of the newly created output dir.

On the command line, the call looks like this:
<code>. ./deshake-all.sh ../myvideo-dir outdir-suffix </code>


For example, with


<code>. ./deshake-all.sh ../wakeboard-test bright128 </code>

...script output will then look like this

    #/home/knut/Videos/wakeboard-test
    #Videos\\wakeboard-test
    #C:\\\\users\\knut\\My Documents\\Videos
    #
    #--------------------------------------------------------------------------------
    #Deshaked Files will be copied from
    #/home/knut/Videos/wakeboard-test
    # to:
    #/home/knut/Videos/wakeboard-test-bright128
    #Windows DirName: C:\\\\users\\knut\\My Documents\\Videos\\wakeboard-test-bright128
    #--------------------------------------------------------------------------------

and for each video, a VirtualDUb GUI will appear indicating the processing status. Preview windows of the input and output videos are disabled on purpose, because then the script is more robust.




