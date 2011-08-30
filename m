Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:59065 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754806Ab1H3ACA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Aug 2011 20:02:00 -0400
Received: by pzk37 with SMTP id 37so9302810pzk.1
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Aug 2011 17:02:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1314662164-8565-1-git-send-email-crquan@gmail.com>
References: <CAH5vBdKxbaKDrA2gAj5CoDYShN+5dnfu6Bmd=4+oV-XmnYQnFA@mail.gmail.com>
	<1314662164-8565-1-git-send-email-crquan@gmail.com>
Date: Mon, 29 Aug 2011 20:02:00 -0400
Message-ID: <CACqU3MXYwbbZ79tMeU3Z30vYn2GxMG+joKFqDRicyGSw5eCGaw@mail.gmail.com>
Subject: Re: [PATCH 1/5] scripts/kconfig/nconf: fix typo: unknow => unknown
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cheng Renquan <crquan@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Nir Tzachar <nir.tzachar@gmail.com>, Randy Dunlap <rdunlap@xenotime.net>, c.rq541@comcast.net

Hi,

On Mon, Aug 29, 2011 at 7:56 PM, Cheng Renquan <crquan@gmail.com> wrote:
> Signed-off-by: Cheng Renquan <crquan@gmail.com>
ACK.

Thanks,
 - Arnaud

> ---
>  scripts/kconfig/nconf.gui.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
> index f8137b3..d3af04e 100644
> --- a/scripts/kconfig/nconf.gui.c
> +++ b/scripts/kconfig/nconf.gui.c
> @@ -461,7 +461,7 @@ int dialog_inputbox(WINDOW *main_window,
>                                result[cursor_position] = res;
>                                cursor_position++;
>                        } else {
> -                               mvprintw(0, 0, "unknow key: %d\n", res);
> +                               mvprintw(0, 0, "unknown key: %d\n", res);
>                        }
>                        break;
>                }
> --
> 1.7.6
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
