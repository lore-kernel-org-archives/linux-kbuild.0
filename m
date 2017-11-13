Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:49644 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751605AbdKMWlr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Nov 2017 17:41:47 -0500
Received: by mail-lf0-f66.google.com with SMTP id w21so20107471lfc.6
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Nov 2017 14:41:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1510569641-28179-1-git-send-email-yamada.masahiro@socionext.com>
References: <1510569641-28179-1-git-send-email-yamada.masahiro@socionext.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 13 Nov 2017 17:41:45 -0500
Message-ID: <CAHC9VhTuxTzTTB6PBesK1UktWbpQD_MN-w9J1S77Exn87-1AwA@mail.gmail.com>
Subject: Re: [PATCH] selinux: remove unnecessary assignment to subdir-
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Eric Paris <eparis@parisplace.org>, selinux@tycho.nsa.gov, linux-kernel@vger.kernel.org, Stephen Smalley <sds@tycho.nsa.gov>

On Mon, Nov 13, 2017 at 5:40 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Makefile.clean descends into $(subdir-y).  Dummy assignment to subdir-
> is meaningless.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> I will pick this up for kbuild tree
> since this is very trivial from the build system point of view.

Okay, thanks.

Acked-by: Paul Moore <paul@paul-moore.com>

>  scripts/selinux/Makefile | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/selinux/Makefile b/scripts/selinux/Makefile
> index e8049da..b3048b8 100644
> --- a/scripts/selinux/Makefile
> +++ b/scripts/selinux/Makefile
> @@ -1,2 +1 @@
>  subdir-y := mdp genheaders
> -subdir-        += mdp genheaders
> --
> 2.7.4

-- 
paul moore
www.paul-moore.com
