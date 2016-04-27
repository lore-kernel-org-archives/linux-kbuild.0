Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e28smtp02.in.ibm.com ([125.16.236.2]:36718 "EHLO
	e28smtp02.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752159AbcD0LA0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 27 Apr 2016 07:00:26 -0400
Received: from localhost
	by e28smtp02.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <naveen.n.rao@linux.vnet.ibm.com>;
	Wed, 27 Apr 2016 16:30:22 +0530
Date: Wed, 27 Apr 2016 16:30:05 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [net-next PATCH V3 3/5] samples/bpf: add a README file to get
 users started
Message-ID: <20160427110005.GC15073@naverao1-tp.in.ibm.com>
References: <20160427072855.29959.70252.stgit@firesoul>
 <20160427073023.29959.17816.stgit@firesoul>
 <20160427083522.GA15073@naverao1-tp.in.ibm.com>
 <20160427111634.38305214@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160427111634.38305214@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jesper Dangaard Brouer <brouer@redhat.com>
Cc: netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, bblanco@plumgrid.com, borkmann@iogearbox.net, alexei.starovoitov@gmail.com

On 2016/04/27 11:16AM, Jesper Dangaard Brouer wrote:
> On Wed, 27 Apr 2016 14:05:22 +0530
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:
> 
> > On 2016/04/27 09:30AM, Jesper Dangaard Brouer wrote:
> > > Getting started with using examples in samples/bpf/ is not
> > > straightforward.  There are several dependencies, and specific
> > > versions of these dependencies.
> > > 
> > > Just compiling the example tool is also slightly obscure, e.g. one
> > > need to call make like:
> > > 
> > >  make samples/bpf/
> > > 
> > > Do notice the "/" slash after the directory name.
> > > 
> > > Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>
> > > ---
> > >  samples/bpf/README.rst |   75 ++++++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 75 insertions(+)
> > >  create mode 100644 samples/bpf/README.rst  
> > 
> > Thanks for adding this! A few nits...
> 
> I would prefer if we could apply this patchset and you could followup
> with a patch with your nits...

... and have another patch just for that?
Regardless, I thought the reason we review is so the patch that goes in 
is already in a good shape.

> 
> > > 
> > > diff --git a/samples/bpf/README.rst b/samples/bpf/README.rst
> > > new file mode 100644
> > > index 000000000000..1fa157db905b
> > > --- /dev/null
> > > +++ b/samples/bpf/README.rst
> > > @@ -0,0 +1,75 @@
> > > +eBPF sample programs
> > > +====================
> > > +
> > > +This kernel samples/bpf directory contains a mini eBPF library, test  
> > 	^^^^^^^^^^^^^^^^^^
> > 'This directory contains' should suffice.
> 
> The reason I formulated it like this, was that people will often hit
> this kind of documentation when searching google.

That doesn't make sense - shouldn't they be looking at a README file in 
the local samples/bpf directory first before going to google?

> 
> 
> > > +stubs, verifier test-suite and examples for using eBPF.
> > > +
> > > +Build dependencies
> > > +==================
> > > +
> > > +Compiling requires having installed:
> > > + * clang >= version 3.4.0
> > > + * llvm >= version 3.7.1
> > > +
> > > +Note that LLVM's tool 'llc' must support target 'bpf', list with command::
> > > +
> > > + $ llc --version  
> > 
> > 'llc --version | grep bpf' is probably simpler?
> 
> I wanted to give people the impression of how the output looks like.

But, that won't help someone trying to check if their installed llc has 
bpf support or not.
> 
> > > + LLVM (http://llvm.org/):
> > > +  LLVM version 3.x.y
> > > +  [...]
> > > +  Host CPU: xxx

For instance, is the above output something the user needs to see to 
ensure BPF support for llc?

> > > +
> > > +  Registered Targets:
> > > +    [...]
> > > +    bpf        - BPF (host endian)
> > > +    bpfeb      - BPF (big endian)
> > > +    bpfel      - BPF (little endian)

The above is what really matters. Adding 'grep bpf' makes it explicit on 
what the user needs to look for.

> > > +    [...]
> > > +
> > > +Kernel headers
> > > +--------------
> > > +
> > > +There are usually dependencies to header files of the current kernel.
> > > +To avoid installing devel kernel headers system wide, as a normal
> > > +user, simply call::
> > > +
> > > + make headers_install
> > > +
> > > +This will creates a local "usr/include" directory in the git/build top
> > > +level directory, that the make system automatically pickup first.
> > > +
> > > +Compiling
> > > +=========
> > > +
> > > +For compiling goto kernel top level build directory and run make like::  
> > 
> > For building the BPF samples, issue the below command from the kernel 
> > root directory:
> 
> I like your formulation better, but it it worth a respin of the entire
> patchset? 
> 
> Notice you need the extra "::" ending of the paragraph, to make this
> document format nicely with RST (ReStructuredText).
> 
> The a README with a .rst suffix will be picked up by github and
> displayed as the doc for the directory. Thus I also made sure it
> "compiles" with the rst tools. E.g see how samples/pktgen gets auto
> documented and nicely formatted via github (scroll down):
>  https://github.com/torvalds/linux/tree/master/samples/pktgen

Looks nice, though I wasn't aware we had any text in the kernel tree 
adhering to this formatting.

> 
> > > +
> > > + make samples/bpf/
> > > +
> > > +Do notice the "/" slash after the directory name.
> > > +
> > > +Manually compiling LLVM with 'bpf' support
> > > +------------------------------------------
> > > +
> > > +Since version 3.7.0, LLVM adds a proper LLVM backend target for the
> > > +BPF bytecode architecture.
> > > +
> > > +By default llvm will build all non-experimental backends including bpf.
> > > +To generate a smaller llc binary one can use::
> > > +
> > > + -DLLVM_TARGETS_TO_BUILD="BPF;X86"  
> > 
> > Is the X86 target really needed?
> 
> I'm not sure, but if you want to use clang/llc for something else it is
> useful, and the example usage of the ";" separator syntax makes it
> worth including as an example.

Ok. The reason I asked is if users need to include the appropriate arch 
target depending on where they build this. It doesn't look like X86 or 
other architecture targets are necessary though.

- Naveen

