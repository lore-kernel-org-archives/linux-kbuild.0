Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:34325 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752764Ab1HaImS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 31 Aug 2011 04:42:18 -0400
Received: by eyx24 with SMTP id 24so367448eyx.19
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Aug 2011 01:42:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1314776773-9560-6-git-send-email-crquan@gmail.com>
References: <CAH5vBdKxbaKDrA2gAj5CoDYShN+5dnfu6Bmd=4+oV-XmnYQnFA@mail.gmail.com>
	<1314776773-9560-1-git-send-email-crquan@gmail.com>
	<1314776773-9560-2-git-send-email-crquan@gmail.com>
	<1314776773-9560-3-git-send-email-crquan@gmail.com>
	<1314776773-9560-4-git-send-email-crquan@gmail.com>
	<1314776773-9560-5-git-send-email-crquan@gmail.com>
	<1314776773-9560-6-git-send-email-crquan@gmail.com>
Date: Wed, 31 Aug 2011 11:42:17 +0300
Message-ID: <CAMT+=WbqfGvAn4JmqcyKCCgH1dMkGexRSh551uDqXh=rdcjxpg@mail.gmail.com>
Subject: Re: [PATCH V2 5/6] scripts/kconfig/nconf: add KEY_HOME / KEY_END for dialog_inputbox
From: Nir Tzachar <nir.tzachar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cheng Renquan <crquan@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Arnaud Lacombe <lacombar@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Randy Dunlap <rdunlap@xenotime.net>, c.rq541@comcast.net

On Wed, Aug 31, 2011 at 10:46 AM, Cheng Renquan <crquan@gmail.com> wrote:
> to make it easier to locate begin/end when editing long strings;
>
> Signed-off-by: Cheng Renquan <crquan@gmail.com>
> ---
>  scripts/kconfig/nconf.gui.c |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
>
> diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
> index a236ae7..1d73897 100644
> --- a/scripts/kconfig/nconf.gui.c
> +++ b/scripts/kconfig/nconf.gui.c
> @@ -465,6 +465,14 @@ int dialog_inputbox(WINDOW *main_window,
>                                cursor_form_win--;
>                        }
>                        break;
> +               case KEY_HOME:
> +                       cursor_position = 0;
> +                       cursor_form_win = 0;
> +                       break;
> +               case KEY_END:
> +                       cursor_position = len;
> +                       cursor_form_win = min(cursor_position, prompt_width-1);
> +                       break;
>                default:
>                        if ((isgraph(res) || isspace(res))) {
>                                /* one for new char, one for '\0' */
> --
> 1.7.6
>
>

Acked By: Nir Tzachar <nir.tzachar@gmail.com>
