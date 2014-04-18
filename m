Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qa0-f51.google.com ([209.85.216.51]:49556 "EHLO
	mail-qa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750893AbaDRBl4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 17 Apr 2014 21:41:56 -0400
Received: by mail-qa0-f51.google.com with SMTP id j7so1080301qaq.24
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Apr 2014 18:41:56 -0700 (PDT)
From: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] selinux, kbuild: remove unnecessary $(hostprogs-y) from clean-files
Date: Thu, 17 Apr 2014 21:41:53 -0400
Message-ID: <5709743.58aAPSG601@sifl>
In-Reply-To: <1397702546-25349-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1397702546-25349-1-git-send-email-yamada.m@jp.panasonic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: selinux@tycho.nsa.gov, linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>

On Thursday, April 17, 2014 11:42:26 AM Masahiro Yamada wrote:
> Files added to hostprogs-y are cleaned. (See scripts/Makefile.clean)
> Adding them to clean-files is redundant.
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> ---
> 
>  scripts/selinux/genheaders/Makefile | 1 -
>  scripts/selinux/mdp/Makefile        | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>
 
> diff --git a/scripts/selinux/genheaders/Makefile
> b/scripts/selinux/genheaders/Makefile index 417b165..1d1ac51 100644
> --- a/scripts/selinux/genheaders/Makefile
> +++ b/scripts/selinux/genheaders/Makefile
> @@ -2,4 +2,3 @@ hostprogs-y	:= genheaders
>  HOST_EXTRACFLAGS += -Isecurity/selinux/include
> 
>  always		:= $(hostprogs-y)
> -clean-files	:= $(hostprogs-y)
> diff --git a/scripts/selinux/mdp/Makefile b/scripts/selinux/mdp/Makefile
> index eb365b3..dba7eff 100644
> --- a/scripts/selinux/mdp/Makefile
> +++ b/scripts/selinux/mdp/Makefile
> @@ -2,4 +2,4 @@ hostprogs-y	:= mdp
>  HOST_EXTRACFLAGS += -Isecurity/selinux/include
> 
>  always		:= $(hostprogs-y)
> -clean-files	:= $(hostprogs-y) policy.* file_contexts
> +clean-files	:= policy.* file_contexts

-- 
paul moore
www.paul-moore.com

