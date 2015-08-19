Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42534 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754152AbbHSOID (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 19 Aug 2015 10:08:03 -0400
Subject: Re: [PATCH] package Makefile: fix perf-tar targets when outdir is set
References: <1434631078-12035-1-git-send-email-riku.voipio@linaro.org>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <55D48DC1.6050802@suse.cz>
Date: Wed, 19 Aug 2015 16:08:01 +0200
MIME-Version: 1.0
In-Reply-To: <1434631078-12035-1-git-send-email-riku.voipio@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: riku.voipio@linaro.org
Cc: linux-kbuild@vger.kernel.org

On 2015-06-18 14:37, riku.voipio@linaro.org wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
> 
> When building with $srctree != $objtree, perf-tar-* targets fail
> to read the MANIFEST file and add the PERF-VERSION-FILE needed
> by out-of-tree builds. The build errors and an incorrect tar is created:
> 
> $ make O=build-x86 perf-targz-src-pkg
>   TAR
> cat: ../tools/perf/MANIFEST: No such file or directory
> tar: perf-4.1.0-rc8/PERF-VERSION-FILE: Cannot stat: No such file or
> dir..
> tar: Exiting with failure status due to previous errors
> 
> Kbuild sets objtree to "." and srctree to ".." The command to output
> MANIFEST becomes:
> 
>    $(cd ..; echo $(cat ../tools/perf/MANIFEST))
> 
> Without MANIFEST, the entire kernel source tree is added to the perf
> source tarball. The *correct* fix is to keep the cd and remove srctree
> from cat command line since MANIFEST has wildcards that fail to expand
> working directory isn't srctree.
> 
> Second, PERF-VERSION-FILE gets not added, because in-tree build path is
> hardcoded to Makefile:
> 
>    util/PERF-VERSION-GEN ../../$(perf-tar)/ 2>/dev/null)
> 
> The PERF-VERSION-GEN needs to be run from tools/perf directory, so
> we can't just replace the hardcoded "../../" bit the relative $objtree
> contents - we need a fully expanded $objtree_full variable to place
> PERF-VERSION-FILE to the right place. Also remove the error redirect
> to /dev/null which hid the error.
> 
> Patch v2: switch from easy fix to correct fix
> 
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---
>  scripts/package/Makefile | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index 99ca6e7..cd5a321 100644
> --- a/scripts/package/Makefile
> +++ b/scripts/package/Makefile
> @@ -33,6 +33,11 @@ TAR_CONTENT := $(KBUILD_ALLDIRS) kernel.spec .config .scmversion Makefile \
>  TAR_CONTENT := $(addprefix $(KERNELPATH)/,$(TAR_CONTENT))
>  MKSPEC     := $(srctree)/scripts/package/mkspec
>  
> +# objtree is relative path, which doesn't work if we cd around
> +ifneq ($(objtree),)
> +  objtree_full := $(shell readlink -f $(objtree) || echo $(objtree))
> +endif
> +
>  # rpm-pkg
>  # ---------------------------------------------------------------------------
>  rpm-pkg rpm: FORCE
> @@ -111,12 +116,12 @@ quiet_cmd_perf_tar = TAR
>        cmd_perf_tar = \
>  git --git-dir=$(srctree)/.git archive --prefix=$(perf-tar)/         \
>  	HEAD^{tree} $$(cd $(srctree);                               \
> -		       echo $$(cat $(srctree)/tools/perf/MANIFEST)) \
> +	               echo $$(cat tools/perf/MANIFEST))            \
>  	-o $(perf-tar).tar;                                         \
>  mkdir -p $(perf-tar);                                               \
>  git --git-dir=$(srctree)/.git rev-parse HEAD > $(perf-tar)/HEAD;    \
>  (cd $(srctree)/tools/perf;                                          \
> -util/PERF-VERSION-GEN ../../$(perf-tar)/ 2>/dev/null);              \
> +util/PERF-VERSION-GEN $(objtree_full)/$(perf-tar)/);                \

Make defines a $(CURDIR) variable, which you can use instead of defining
your own.

Michal
