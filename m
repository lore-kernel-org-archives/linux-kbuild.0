Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:65348 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751565Ab0LOGXr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Dec 2010 01:23:47 -0500
Received: by iyi12 with SMTP id 12so710820iyi.19
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Dec 2010 22:23:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1291531935-6183-1-git-send-email-lacombar@gmail.com>
References: <1291531935-6183-1-git-send-email-lacombar@gmail.com>
Date: Wed, 15 Dec 2010 01:23:46 -0500
Message-ID: <AANLkTi=qmmyK=XNO8RG+t1x51ZV2kgNCKgJbNuu4HK-C@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig/conf: kill deadcode
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

Hi,

On Sun, Dec 5, 2010 at 1:52 AM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> This is likely to break the swith statement if the one of the enum member ever
> reach 63 ('?').
>
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/conf.c |    4 ----
>  1 files changed, 0 insertions(+), 4 deletions(-)
>
ping ?

 - Arnaud

> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 8e33aa7..057f49a 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -503,10 +503,6 @@ int main(int ac, char **av)
>                        srand(seed);
>                        break;
>                }
> -               case '?':
> -                       fprintf(stderr, _("See README for usage info\n"));
> -                       exit(1);
> -                       break;
>                }
>        }
>        if (ac == optind) {
> --
> 1.7.2.30.gc37d7.dirty
>
>
