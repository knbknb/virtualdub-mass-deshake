virtualdub-mass-deshake
=======================


<h4> Mass-deshaking videos with the freeware VirtualDub,on Linux. </h4>

VirtualDub will attempt to process all files in an entire directory. Using a bash command line, You specify the directory name and the suffix of the newly created output dir.

On the command line, the call looks like this:
<code>. ./deshake-all.sh ../myvideo-dir outdir-suffix </code>

Output will then look like this

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

Requirements:
  - wine 1.x
  - Virtualdub > 1.6
  - Deshaker Plugin installed
  - Virtualdub.exe must be on the wine Path
  - there needs to be a .vdscript file present with the filter settings saved away properly.



