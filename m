Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:61509 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751790Ab1HaIap convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 31 Aug 2011 04:30:45 -0400
Received: by ewy4 with SMTP id 4so241645ewy.19
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Aug 2011 01:30:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1314776773-9560-3-git-send-email-crquan@gmail.com>
References: <CAH5vBdKxbaKDrA2gAj5CoDYShN+5dnfu6Bmd=4+oV-XmnYQnFA@mail.gmail.com>
	<1314776773-9560-1-git-send-email-crquan@gmail.com>
	<1314776773-9560-2-git-send-email-crquan@gmail.com>
	<1314776773-9560-3-git-send-email-crquan@gmail.com>
Date: Wed, 31 Aug 2011 11:30:44 +0300
Message-ID: <CAMT+=Wb8GWgy4+zwzj6egLO0ouu++4uVGER+Lt7jYxOAEm184w@mail.gmail.com>
Subject: Re: [PATCH V2 2/6] scripts/kconfig/nconf: fix memmove's length arg
From: Nir Tzachar <nir.tzachar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cheng Renquan <crquan@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Arnaud Lacombe <lacombar@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Randy Dunlap <rdunlap@xenotime.net>, c.rq541@comcast.net

On Wed, Aug 31, 2011 at 10:46 AM, Cheng Renquan <crquan@gmail.com> wrote:
> In case KEY_BACKSPACE / KEY_DC to delete a char, it memmove only
> (len-cursor_position+1) bytes;
> the default case is to insert a char, it should also memmove exactly
> (len-cursor_position+1) bytes;
>
> the original use of (len+1) is wrong and may access following memory
> that doesn't belong to result, may cause SegFault in theory;
>
>        case KEY_BACKSPACE:
>                if (cursor_position > 0) {
>                        memmove(&result[cursor_position-1],
>                                        &result[cursor_position],
>                                        len-cursor_position+1);
>                        cursor_position--;
>                }
>                break;
>        case KEY_DC:
>                if (cursor_position >= 0 && cursor_position < len) {
>                        memmove(&result[cursor_position],
>                                        &result[cursor_position+1],
>                                        len-cursor_position+1);
>                }
>                break;
>        default:
>                if ((isgraph(res) || isspace(res)) &&
>                                len-2 < result_len) {
>                        /* insert the char at the proper position */
>                        memmove(&result[cursor_position+1],
>                                        &result[cursor_position],
>                                        len-cursor_position+1);
>                        result[cursor_position] = res;
>                        cursor_position++;
>                }
>
> Signed-off-by: Cheng Renquan <crquan@gmail.com>
> ---
>  scripts/kconfig/nconf.gui.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
> index d3af04e..3ce2a7c 100644
> --- a/scripts/kconfig/nconf.gui.c
> +++ b/scripts/kconfig/nconf.gui.c
> @@ -457,7 +457,7 @@ int dialog_inputbox(WINDOW *main_window,
>                                /* insert the char at the proper position */
>                                memmove(&result[cursor_position+1],
>                                                &result[cursor_position],
> -                                               len+1);
> +                                               len-cursor_position+1);
>                                result[cursor_position] = res;
>                                cursor_position++;
>                        } else {
> --
> 1.7.6
>
>

Acked-by: Nir Tzachar <nir.tzachar@gmail.com>
