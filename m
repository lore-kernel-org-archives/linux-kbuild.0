Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:33497 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750953Ab1EORiB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 15 May 2011 13:38:01 -0400
MIME-Version: 1.0
In-Reply-To: <20110512133356.GI13293@sepie.suse.cz>
References: <1303837564-18062-1-git-send-email-rabin@rab.in>
 <BANLkTimLre+UY1fY6+HXEsJicyh_oMnWdA@mail.gmail.com> <20110512133356.GI13293@sepie.suse.cz>
From: Rabin Vincent <rabin@rab.in>
Date: Sun, 15 May 2011 23:07:19 +0530
Message-ID: <BANLkTiktdW3N35YYDB6dmUOMG1ZbQpYrow@mail.gmail.com>
Subject: Re: [PATCH] kbuild: make KBUILD_NOCMDDEP=1 handle empty built-in.o
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Thu, May 12, 2011 at 19:03, Michal Marek <mmarek@suse.cz> wrote:
> I'm not sure if this is the rigt way to fix it. Kbuild.include should
> not care about obj-*. The problem is that arg-check is always empty with
> KBUILD_NOCMDDEP and if there are no other dependencies, the target will
> not be created, right? IMO we only need to make sure that during the
> first make run, arg-check always expands to non-empty, even with
> KBUILD_NOCMDDEP. So we can drop the $(obj-y) test and do it like this
> (untested), can't we?
>
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index c034dd7..be39cd1 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -197,6 +197,8 @@ ifneq ($(KBUILD_NOCMDDEP),1)
>  # User may override this check using make KBUILD_NOCMDDEP=1
>  arg-check = $(strip $(filter-out $(cmd_$(1)), $(cmd_$@)) \
>                     $(filter-out $(cmd_$@),   $(cmd_$(1))) )
> +else
> +arg-check = $(if $(strip $(cmd_$@)),,1)
>  endif
>
>  # >'< substitution is for echo to work,

This works for me, thanks.

Tested-by: Rabin Vincent <rabin@rab.in>

> while at it, we should also add KBUILD_NOCMDDEP to
> Documentation/kbuild/kbuild.txt.

I will try to write up something for this.
