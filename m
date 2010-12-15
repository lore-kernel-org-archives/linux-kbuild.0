Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:52543 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752398Ab0LOG0q convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Dec 2010 01:26:46 -0500
Received: by mail-iw0-f174.google.com with SMTP id 9so1670011iwn.19
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Dec 2010 22:26:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1291531278-7395-4-git-send-email-lacombar@gmail.com>
References: <1291531278-7395-1-git-send-email-lacombar@gmail.com>
	<1291531278-7395-4-git-send-email-lacombar@gmail.com>
Date: Wed, 15 Dec 2010 01:26:46 -0500
Message-ID: <AANLkTin5maM5mJGQtMoOqfeyyVWh3SrYDai0WDBezAmE@mail.gmail.com>
Subject: Re: [PATCH 4/5] kconfig/conf: merge duplicate switch's case
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
>  scripts/kconfig/conf.c |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
>
ping ?

 - Arnaud

> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 1b58129..8e33aa7 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -541,8 +541,6 @@ int main(int ac, char **av)
>                }
>                break;
>        case savedefconfig:
> -               conf_read(NULL);
> -               break;
>        case silentoldconfig:
>        case oldaskconfig:
>        case oldconfig:
> --
> 1.7.2.30.gc37d7.dirty
>
>
