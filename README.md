virtualdub-mass-deshake
=======================


<h4> Mass-deshaking videos with the freeware VirtualDub,on Linux. </h4>

VirtualDub will attempt to process all files in an entire directory. Using a bash command line, you'll specify the directory name and the suffix of the newly created output dir.

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

Requirements:
  - wine 1.x
  - Virtualdub > 1.6
  - Deshaker Plugin installed
  - Virtualdub.exe must be on the wine Path
  - there needs to be a .vdscript file present with the filter settings saved away properly.



