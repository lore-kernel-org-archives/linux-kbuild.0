Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:49149 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750778Ab1H3AQl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Aug 2011 20:16:41 -0400
Received: by wwf5 with SMTP id 5so6268549wwf.1
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Aug 2011 17:16:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1314662164-8565-3-git-send-email-crquan@gmail.com>
References: <CAH5vBdKxbaKDrA2gAj5CoDYShN+5dnfu6Bmd=4+oV-XmnYQnFA@mail.gmail.com>
 <1314662164-8565-1-git-send-email-crquan@gmail.com> <1314662164-8565-2-git-send-email-crquan@gmail.com>
 <1314662164-8565-3-git-send-email-crquan@gmail.com>
From: Cheng Renquan <crquan@gmail.com>
Date: Mon, 29 Aug 2011 17:16:20 -0700
Message-ID: <CAH5vBdJu4xK-Hj+DCp2yO5d=fijPMisKGqqpUkjdpoL0TbmaCQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] scripts/kconfig/nconf: dynamically alloc dialog_input_result
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Content-Transfer-Encoding: 8bit
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Nir Tzachar <nir.tzachar@gmail.com>, Randy Dunlap <rdunlap@xenotime.net>, c.rq541@comcast.net

On Mon, Aug 29, 2011 at 4:56 PM, Cheng Renquan <crquan@gmail.com> wrote:
> to support unlimited length string config items;
>
> Signed-off-by: Cheng Renquan <crquan@gmail.com>
> ---
>  scripts/kconfig/nconf.c     |   24 ++++++++++++++++--------
>  scripts/kconfig/nconf.gui.c |   25 ++++++++++++++++++++-----
>  scripts/kconfig/nconf.h     |    2 +-
>  3 files changed, 37 insertions(+), 14 deletions(-)

> diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
> index 3ce2a7c..bc482ad 100644
> --- a/scripts/kconfig/nconf.gui.c
> +++ b/scripts/kconfig/nconf.gui.c
> @@ -356,7 +356,7 @@ int btn_dialog(WINDOW *main_window, const char *msg, int btn_num, ...)
>
>  int dialog_inputbox(WINDOW *main_window,
>                const char *title, const char *prompt,
> -               const char *init, char *result, int result_len)
> +               const char *init, char *result, int *result_len)
>  {
>        int prompt_lines = 0;
>        int prompt_width = 0;
> @@ -368,6 +368,14 @@ int dialog_inputbox(WINDOW *main_window,
>        int res = -1;
>        int cursor_position = strlen(init);
>
> +       if (strlen(init) > *result_len) {
> +               do {
> +                       *result_len *= 2;
> +               } while (strlen(init) > *result_len);
> +               result = realloc(result, *result_len);
> +               /* here didn't check result, if it's NULL,
> +                  just let it silently fail (SegFault) */
> +       }
>
>        /* find the widest line of msg: */
>        prompt_lines = get_line_no(prompt);
> @@ -384,7 +392,7 @@ int dialog_inputbox(WINDOW *main_window,
>        y = (LINES-(prompt_lines+4))/2;
>        x = (COLS-(prompt_width+4))/2;
>
> -       strncpy(result, init, result_len);
> +       strncpy(result, init, *result_len);
>
>        /* create the windows */
>        win = newwin(prompt_lines+6, prompt_width+7, y, x);
> @@ -443,7 +451,7 @@ int dialog_inputbox(WINDOW *main_window,
>                case KEY_UP:
>                case KEY_RIGHT:
>                        if (cursor_position < len &&
> -                           cursor_position < min(result_len, prompt_width))
> +                           cursor_position < min(*result_len, prompt_width))
>                                cursor_position++;
>                        break;
>                case KEY_DOWN:
> @@ -452,8 +460,15 @@ int dialog_inputbox(WINDOW *main_window,
>                                cursor_position--;
>                        break;
>                default:
> -                       if ((isgraph(res) || isspace(res)) &&
> -                                       len-2 < result_len) {
> +                       if ((isgraph(res) || isspace(res))) {
> +                               /* one for new char, one for '\0' */
> +                               if (len+2 > *result_len) {
> +                                       do {
> +                                               *result_len *= 2;
> +                                       } while (len+2 > *result_len);
> +                                       result = realloc(result, *result_len);
> +                                       /* silently fail in the same way above */

Sorry, here I really want to say "silently fail in the same way if
realloc returns NULL", or we could alternatively call exit(1) for a
graceful exit; also need to call ncurses cleanup first; but how about
silent fail?
���{.n�+�������+%�����ݶ��w��{.n�+����{��F�W��{ay�ʇڙ�,j��f���h��������z_�(�階�ݢj"���m������G������?����&���~��
