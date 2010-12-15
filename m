Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:44852 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751037Ab0LOGXK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Dec 2010 01:23:10 -0500
Received: by mail-iy0-f174.google.com with SMTP id 12so710451iyi.19
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Dec 2010 22:23:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1291530717-26889-1-git-send-email-lacombar@gmail.com>
References: <1291530717-26889-1-git-send-email-lacombar@gmail.com>
Date: Wed, 15 Dec 2010 01:23:10 -0500
Message-ID: <AANLkTin_WGkyr3e+e3zTze3rur1AHxm1LE=u6G7Msmpw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: do not define AUTOCONF_INCLUDED
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

Hi,

On Sun, Dec 5, 2010 at 1:31 AM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> AUTOCONF_INCLUDED is not checked is not used within the tree and its parent
> header, `autoconf.h', is safe to be re-included.
>
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/confdata.c |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
>
ping ?

 - Arnaud

> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 9df8011..f349bdc 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -833,8 +833,7 @@ int conf_write_autoconf(void)
>                       " * Automatically generated C config: don't edit\n"
>                       " * %s\n"
>                       " * %s"
> -                      " */\n"
> -                      "#define AUTOCONF_INCLUDED\n",
> +                      " */\n",
>                       rootmenu.prompt->text, ctime(&now));
>
>        for_all_symbols(i, sym) {
> --
> 1.7.2.30.gc37d7.dirty
>
>
