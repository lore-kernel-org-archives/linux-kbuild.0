Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:34923 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752048AbbLIVec (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Dec 2015 16:34:32 -0500
Received: by oige206 with SMTP id e206so34211189oig.2
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Dec 2015 13:34:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1402652395-28779-1-git-send-email-mmarek@suse.cz>
References: <CALCETrWSX1nVqyfe0Ee2rUvpHosTRyW8GSJfr52UCpT566-eWA@mail.gmail.com>
 <1402652395-28779-1-git-send-email-mmarek@suse.cz>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 9 Dec 2015 13:34:12 -0800
Message-ID: <CALCETrWToro=6RvnDm023eOooqCmkRixRpLYAcFnPvJES8jAjA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Do not run modules_install and install in paralel
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jun 13, 2014 at 2:39 AM, Michal Marek <mmarek@suse.cz> wrote:
> Based on a x86-only patch by Andy Lutomirski <luto@amacapital.net>
>
> With modular kernels, 'make install' is going to need the installed
> modules at some point to generate the initramfs.
>
> Signed-off-by: Michal Marek <mmarek@suse.cz>
> ---
>  Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 7680d7c..7e5e483 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -503,6 +503,12 @@ ifeq ($(KBUILD_EXTMOD),)
>                  endif
>          endif
>  endif
> +# install and module_install need also be processed one by one
> +ifneq ($(filter install,$(MAKECMDGOALS)),)
> +        ifneq ($(filter modules_install,$(MAKECMDGOALS)),)
> +               mixed-targets := 1
> +        endif
> +endif
>
>  ifeq ($(mixed-targets),1)
>  # ===========================================================================
> --
> 1.9.2
>

This patch seems to have gotten lost.  Do you still like it?  If so,
can someone apply it, please?

--Andy
