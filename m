Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:48051 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfBEIPz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Feb 2019 03:15:55 -0500
MIME-Version: 1.0
References: <CAK7LNAS8g3g3OTtqTN8begMxzbSS82Wn0CqY8u6vuELEZaLo3g@mail.gmail.com>
 <20190203084840.6113-1-vladimir.kondratiev@intel.com>
In-Reply-To: <20190203084840.6113-1-vladimir.kondratiev@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 5 Feb 2019 17:15:11 +0900
Message-ID: <CAK7LNAS0XOch3SuCJAh8Mq0s9Y9FGNJaESbYHD8yNywnzVkg2Q@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: gitignore output directory
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Vladimir Kondratiev <vladimir.kondratiev@linux.intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Feb 3, 2019 at 5:50 PM Vladimir Kondratiev
<vladimir.kondratiev@intel.com> wrote:
>
> From: Vladimir Kondratiev <vladimir.kondratiev@linux.intel.com>
>
> When compiling into output directory using O=, many files
> created under KBUILD_OUTPUT that git considers
> as new ones; git clients, ex. "git gui" lists it, and it clutters
> file list making it difficult to see what was really changed
>
> Generate .gitignore in output directory that ignores all
> its content
>
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@linux.intel.com>
> ---

Applied to linux-kbuild.

Thanks.


>  Makefile | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 141653226f3c..b1d651e822b1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -483,10 +483,13 @@ PHONY += outputmakefile
>  # outputmakefile generates a Makefile in the output directory, if using a
>  # separate output directory. This allows convenient use of make in the
>  # output directory.
> +# At the same time when output Makefile generated, generate .gitignore to
> +# ignore whole output directory
>  outputmakefile:
>  ifneq ($(KBUILD_SRC),)
>         $(Q)ln -fsn $(srctree) source
>         $(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkmakefile $(srctree)
> +       $(Q){ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
>  endif
>
>  ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
> --
> 2.19.1
>
> ---------------------------------------------------------------------
> Intel Israel (74) Limited
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
>


-- 
Best Regards
Masahiro Yamada
