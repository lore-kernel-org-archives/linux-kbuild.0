Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:51208 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752196Ab0LOGYU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Dec 2010 01:24:20 -0500
Received: by iyi12 with SMTP id 12so710994iyi.19
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Dec 2010 22:24:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1291531278-7395-1-git-send-email-lacombar@gmail.com>
References: <1291531278-7395-1-git-send-email-lacombar@gmail.com>
Date: Wed, 15 Dec 2010 01:24:19 -0500
Message-ID: <AANLkTi=jdTtaUhZcf1Hq4jeu45eH2s9z_Sx+xCSKzCt6@mail.gmail.com>
Subject: Re: [PATCH 1/5] kbuild/nconf: fix spaces damage
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

Hi,

On Sun, Dec 5, 2010 at 1:41 AM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/nconf.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
ping ?

 - Arnaud

> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index 272a987..eda49ff 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
> @@ -248,7 +248,7 @@ search_help[] = N_(
>  "Only relevant lines are shown.\n"
>  "\n\n"
>  "Search examples:\n"
> -"Examples: USB   = > find all symbols containing USB\n"
> +"Examples: USB  => find all symbols containing USB\n"
>  "          ^USB => find all symbols starting with USB\n"
>  "          USB$ => find all symbols ending with USB\n"
>  "\n");
> --
> 1.7.2.30.gc37d7.dirty
>
>
