Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:50194 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752384Ab0LOGZt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Dec 2010 01:25:49 -0500
Received: by yxt3 with SMTP id 3so854755yxt.19
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Dec 2010 22:25:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1291531278-7395-5-git-send-email-lacombar@gmail.com>
References: <1291531278-7395-1-git-send-email-lacombar@gmail.com>
	<1291531278-7395-5-git-send-email-lacombar@gmail.com>
Date: Wed, 15 Dec 2010 01:25:49 -0500
Message-ID: <AANLkTi=7ruO6TfFeq6Troapq_rBvgqAtva7StKsB=rzr@mail.gmail.com>
Subject: Re: [PATCH 5/5] kconfig: fix `zconfdebug' extern declaration
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

Hi,

On Sun, Dec 5, 2010 at 1:41 AM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> This symbol is only exist if YYDEBUG is defined.
>
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/lkc.h |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
>
ping ?

 - Arnaud

> diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
> index 16eb416..2b856a8 100644
> --- a/scripts/kconfig/lkc.h
> +++ b/scripts/kconfig/lkc.h
> @@ -68,10 +68,12 @@ struct kconf_id {
>        enum symbol_type stype;
>  };
>
> +#ifdef YYDEBUG
> +extern int zconfdebug;
> +#endif
> +
>  int zconfparse(void);
>  void zconfdump(FILE *out);
> -
> -extern int zconfdebug;
>  void zconf_starthelp(void);
>  FILE *zconf_fopen(const char *name);
>  void zconf_initscan(const char *name);
> --
> 1.7.2.30.gc37d7.dirty
>
>
