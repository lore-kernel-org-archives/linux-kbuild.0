Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from www62.your-server.de ([213.133.104.62]:60402 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727140AbfKKNty (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Nov 2019 08:49:54 -0500
Subject: Re: [net-next PATCH] samples/bpf: adjust Makefile and README.rst
References: <157340347607.14617.683175264051058224.stgit@firesoul>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <a1e149a5-af72-0602-d48d-ec7e6939df22@iogearbox.net>
Date: Mon, 11 Nov 2019 14:49:51 +0100
MIME-Version: 1.0
In-Reply-To: <157340347607.14617.683175264051058224.stgit@firesoul>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jesper Dangaard Brouer <brouer@redhat.com>
Cc: bpf@vger.kernel.org, linux-kbuild@vger.kernel.org, netdev@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Daniel Borkmann <borkmann@iogearbox.net>, Alexei Starovoitov <alexei.starovoitov@gmail.com>

On 11/10/19 5:31 PM, Jesper Dangaard Brouer wrote:
> Side effect of some kbuild changes resulted in breaking the
> documented way to build samples/bpf/.
> 
> This patch change the samples/bpf/Makefile to work again, when
> invoking make from the subdir samples/bpf/. Also update the
> documentation in README.rst, to reflect the new way to build.
> 
> Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>

Please make sure to have bpf@vger.kernel.org Cc'ed in future as well
(done here). Given net-next in subject, any specific reason you need
this expedited over normal bpf-next route? Looks like there is no
conflict either way.

In any case, change looks good to me:

Acked-by: Daniel Borkmann <daniel@iogearbox.net>

> ---
>   samples/bpf/Makefile   |    4 ++--
>   samples/bpf/README.rst |   12 +++++-------
>   2 files changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/samples/bpf/Makefile b/samples/bpf/Makefile
> index d88c01275239..8e32a4d29a38 100644
> --- a/samples/bpf/Makefile
> +++ b/samples/bpf/Makefile
> @@ -203,7 +203,7 @@ TPROGLDLIBS_test_overhead	+= -lrt
>   TPROGLDLIBS_xdpsock		+= -pthread
>   
>   # Allows pointing LLC/CLANG to a LLVM backend with bpf support, redefine on cmdline:
> -#  make samples/bpf/ LLC=~/git/llvm/build/bin/llc CLANG=~/git/llvm/build/bin/clang
> +#  make M=samples/bpf/ LLC=~/git/llvm/build/bin/llc CLANG=~/git/llvm/build/bin/clang
>   LLC ?= llc
>   CLANG ?= clang
>   LLVM_OBJCOPY ?= llvm-objcopy
> @@ -246,7 +246,7 @@ endif
>   
>   # Trick to allow make to be run from this directory
>   all:
> -	$(MAKE) -C ../../ $(CURDIR)/ BPF_SAMPLES_PATH=$(CURDIR)
> +	$(MAKE) -C ../../ M=$(CURDIR) BPF_SAMPLES_PATH=$(CURDIR)
>   
>   clean:
>   	$(MAKE) -C ../../ M=$(CURDIR) clean
> diff --git a/samples/bpf/README.rst b/samples/bpf/README.rst
> index cc1f00a1ee06..dd34b2d26f1c 100644
> --- a/samples/bpf/README.rst
> +++ b/samples/bpf/README.rst
> @@ -46,12 +46,10 @@ Compiling
>   For building the BPF samples, issue the below command from the kernel
>   top level directory::
>   
> - make samples/bpf/
> -
> -Do notice the "/" slash after the directory name.
> + make M=samples/bpf
>   
>   It is also possible to call make from this directory.  This will just
> -hide the the invocation of make as above with the appended "/".
> +hide the invocation of make as above.
>   
>   Manually compiling LLVM with 'bpf' support
>   ------------------------------------------
> @@ -77,7 +75,7 @@ Quick sniplet for manually compiling LLVM and clang
>   It is also possible to point make to the newly compiled 'llc' or
>   'clang' command via redefining LLC or CLANG on the make command line::
>   
> - make samples/bpf/ LLC=~/git/llvm/build/bin/llc CLANG=~/git/llvm/build/bin/clang
> + make M=samples/bpf LLC=~/git/llvm/build/bin/llc CLANG=~/git/llvm/build/bin/clang
>   
>   Cross compiling samples
>   -----------------------
> @@ -98,10 +96,10 @@ Pointing LLC and CLANG is not necessarily if it's installed on HOST and have
>   in its targets appropriate arm64 arch (usually it has several arches).
>   Build samples::
>   
> - make samples/bpf/
> + make M=samples/bpf
>   
>   Or build samples with SYSROOT if some header or library is absent in toolchain,
>   say libelf, providing address to file system containing headers and libs,
>   can be RFS of target board::
>   
> - make samples/bpf/ SYSROOT=~/some_sysroot
> + make M=samples/bpf SYSROOT=~/some_sysroot
> 
