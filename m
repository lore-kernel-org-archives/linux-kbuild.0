Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f179.google.com ([209.85.192.179]:35139 "EHLO
	mail-pf0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752293AbcDZOfa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2016 10:35:30 -0400
Date: Tue, 26 Apr 2016 07:35:25 -0700
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: [net-next PATCH 4/4] samples/bpf: allow make to be run from
 samples/bpf/ directory
Message-ID: <20160426143524.GB39797@ast-mbp.thefacebook.com>
References: <20160426110828.20716.13392.stgit@firesoul>
 <20160426110932.20716.51360.stgit@firesoul>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160426110932.20716.51360.stgit@firesoul>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jesper Dangaard Brouer <brouer@redhat.com>
Cc: netdev@vger.kernel.org, bblanco@plumgrid.com, borkmann@iogearbox.net, linux-kbuild@vger.kernel.org

On Tue, Apr 26, 2016 at 01:09:32PM +0200, Jesper Dangaard Brouer wrote:
> It is not intuitive that 'make' must be run from the top level
> directory with argument "samples/bpf/" to compile these eBPF samples.
> 
> Introduce a kbuild make file trick that allow make to be run from the
> "samples/bpf/" directory itself.  It basically change to the top level
> directory and call "make samples/bpf/" with the "/" slash after the
> directory name.
> 
> Also add a clean target that only cleans this directory, by taking
> advantage of the kbuild external module setting M=$PWD.
> 
> Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>
> ---
>  samples/bpf/Makefile   |    8 ++++++++
>  samples/bpf/README.rst |    3 +++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/samples/bpf/Makefile b/samples/bpf/Makefile
> index 7ac66f5bbbf5..7370dfee482f 100644
> --- a/samples/bpf/Makefile
> +++ b/samples/bpf/Makefile
> @@ -85,6 +85,14 @@ HOSTLOADLIBES_test_overhead += -lelf -lrt
>  #  make samples/bpf/ LLC=~/git/llvm/build/bin/llc
>  LLC ?= llc
>  
> +# Trick to allow make to be run from this directory
> +all:
> +	$(MAKE) -C ../../ $$PWD/
> +
> +clean:
> +	$(MAKE) -C ../../ M=$$PWD clean
> +	@rm -f *~
> +

nice trick!

