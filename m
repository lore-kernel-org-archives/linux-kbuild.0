Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:38717 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752262AbbFRMdi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 18 Jun 2015 08:33:38 -0400
Received: by wibdq8 with SMTP id dq8so85427741wib.1
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Jun 2015 05:33:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1434544441-2973-1-git-send-email-riku.voipio@linaro.org>
References: <1434544441-2973-1-git-send-email-riku.voipio@linaro.org>
Date: Thu, 18 Jun 2015 15:33:37 +0300
Message-ID: <CAAqcGHnuAPOWj5KicLe8ijA6VO3YCk_H72hy7wzC=z1U+COazQ@mail.gmail.com>
Subject: Re: [PATCH] package Makefile: fix perf-tar targets when outdir is set
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, mmarek <mmarek@suse.cz>
Cc: Riku Voipio <riku.voipio@linaro.org>

On 17 June 2015 at 15:34,  <riku.voipio@linaro.org> wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
>
> When building with $srctree != $objtree, perf-tar-* targets fail
> to read the MANIFEST file and add the PERF-VERSION-FILE needed
> by out-of-tree builds. The build errors and an incorrect tar is created:
>
> $ make O=build-x86 perf-targz-src-pkg
>   TAR
> cat: ../tools/perf/MANIFEST: No such file or directory
> tar: perf-4.1.0-rc8/PERF-VERSION-FILE: Cannot stat: No such file or dir..
> tar: Exiting with failure status due to previous errors
>
> Kbuild sets objtree to "." and srctree to ".." The command to output
> MANIFEST becomes:
>
>    $(cd ..; echo $(cat ../tools/perf/MANIFEST))
>
> Without MANIFEST, the entire kernel source tree is added to the perf
> source tarball. The easy fix is removing the unneccesary cd $objtree bit.

Easy but wrong. MANIFEST has wildcards that fail to expand if current directory
isn't srctree. Updated patch coming.

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
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---
>  scripts/package/Makefile | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index 99ca6e7..98f934c 100644
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
> @@ -110,13 +115,12 @@ perf-tar=perf-$(KERNELVERSION)
>  quiet_cmd_perf_tar = TAR
>        cmd_perf_tar = \
>  git --git-dir=$(srctree)/.git archive --prefix=$(perf-tar)/         \
> -       HEAD^{tree} $$(cd $(srctree);                               \
> -                      echo $$(cat $(srctree)/tools/perf/MANIFEST)) \
> +       HEAD^{tree} $$(echo $$(cat $(srctree)/tools/perf/MANIFEST)) \
>         -o $(perf-tar).tar;                                         \
>  mkdir -p $(perf-tar);                                               \
>  git --git-dir=$(srctree)/.git rev-parse HEAD > $(perf-tar)/HEAD;    \
>  (cd $(srctree)/tools/perf;                                          \
> -util/PERF-VERSION-GEN ../../$(perf-tar)/ 2>/dev/null);              \
> +util/PERF-VERSION-GEN $(objtree_full)/$(perf-tar)/);                \
>  tar rf $(perf-tar).tar $(perf-tar)/HEAD $(perf-tar)/PERF-VERSION-FILE; \
>  rm -r $(perf-tar);                                                  \
>  $(if $(findstring tar-src,$@),,                                     \
> --
> 2.1.4
>
