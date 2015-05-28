Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:33886 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673AbbE1JuE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 May 2015 05:50:04 -0400
Received: by wicmc15 with SMTP id mc15so118149949wic.1
        for <linux-kbuild@vger.kernel.org>; Thu, 28 May 2015 02:50:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1431606908-20880-1-git-send-email-corsac@debian.org>
References: <1431606908-20880-1-git-send-email-corsac@debian.org>
Date: Thu, 28 May 2015 12:50:03 +0300
Message-ID: <CAAqcGHkhVG9YKtda0y97gsrz26RKpnAibOfNE2Y1xUEXfKr+=w@mail.gmail.com>
Subject: Re: [PATCH] builddeb: generate a changes file from the build
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Yves-Alexis Perez <corsac@debian.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi,

On 14 May 2015 at 15:35, Yves-Alexis Perez <corsac@debian.org> wrote:
> A changes file (also called Debian upload control file) contains
> information about binary packages, including the changelog entry, the
> maintainer, the package list and the checksums.
>
> It can be used by various Debian tools like dput and dcmd to execute
> action on all the build packages at once, for example uploading the
> packages to an dedicated Debian repository.

This change is also part for my "add source package" patch:

http://article.gmane.org/gmane.linux.kbuild.devel/13336

> ---
>  scripts/package/builddeb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 88dbf23..46c2838 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -383,4 +383,7 @@ EOF
>         create_package "$dbg_packagename" "$dbg_dir"
>  fi
>
> +# Generate a change file
> +(cd $KBUILD_OUTPUT; dpkg-genchanges -b > ../linux_${packageversion}_${debarch}.changes)
> +
>  exit 0
> --
> 2.1.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
