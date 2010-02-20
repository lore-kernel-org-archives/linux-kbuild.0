Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qy0-f179.google.com ([209.85.221.179]:59624 "EHLO
	mail-qy0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755971Ab0BTEh2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 19 Feb 2010 23:37:28 -0500
Received: by qyk9 with SMTP id 9so496925qyk.22
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Feb 2010 20:37:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1266612308-2911-1-git-send-email-mmarek@suse.cz>
References: <1266612308-2911-1-git-send-email-mmarek@suse.cz>
Date: Sat, 20 Feb 2010 12:30:49 +0800
Message-ID: <2375c9f91002192030w27d110c5w3a835055d7f318ae@mail.gmail.com>
Subject: Re: [PATCH] tags: Use $SRCARCH
From: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Guennadi Liakhovetski <g.liakhovetski@gmx.de>

On Sat, Feb 20, 2010 at 4:45 AM, Michal Marek <mmarek@suse.cz> wrote:
> $ make mrproper
> $ make tags
>  GEN     tags
>  find: `arch/x86_64/': No such file or directory
>
> Caused by commit f81b1be (tags: include headers before source files)
>
> Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> Cc: WANG Cong <xiyou.wangcong@gmail.com>
> Signed-off-by: Michal Marek <mmarek@suse.cz>


Ah, this looks fine. Thanks for this!

Acked-by: WANG Cong <xiyou.wangcong@gmail.com>

> ---
>  scripts/tags.sh |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/tags.sh b/scripts/tags.sh
> index c122041..9f45953 100755
> --- a/scripts/tags.sh
> +++ b/scripts/tags.sh
> @@ -5,7 +5,7 @@
>  # mode may be any of: tags, TAGS, cscope
>  #
>  # Uses the following environment variables:
> -# ARCH, SUBARCH, srctree, src, obj
> +# ARCH, SUBARCH, SRCARCH, srctree, src, obj
>
>  if [ "$KBUILD_VERBOSE" = "1" ]; then
>        set -x
> @@ -70,7 +70,7 @@ find_sources()
>
>  all_sources()
>  {
> -       find_arch_include_sources ${ARCH} '*.[chS]'
> +       find_arch_include_sources ${SRCARCH} '*.[chS]'
>        if [ ! -z "$archinclude" ]; then
>                find_arch_include_sources $archinclude '*.[chS]'
>        fi
> --
> 1.6.5.3
>
>
