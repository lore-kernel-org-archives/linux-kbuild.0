Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:54249 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728790AbfC2HvG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Mar 2019 03:51:06 -0400
MIME-Version: 1.0
References: <20190325151647.11581-1-changbin.du@gmail.com>
In-Reply-To: <20190325151647.11581-1-changbin.du@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 29 Mar 2019 16:50:18 +0900
Message-ID: <CAK7LNARkTQoAhjk7qPR4Pn0SHKvW4cvSrtC5brATQ2LbsWegtw@mail.gmail.com>
Subject: Re: [PATCH] kconfig/[mn]conf: handle backspace (^H) key
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Changbin Du <changbin.du@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Mar 26, 2019 at 12:16 AM Changbin Du <changbin.du@gmail.com> wrote:
>
> Backspace is not working on some terminal emulators which do not send the
> key code defined by terminfo. Terminals either send '^H' (8) or '^?' (127).
> But currently only '$?' is handled.



Shall I fix '$?' to '^?'
if it is a typo?




> Let's also handle '^H' for those
> terminals.
>
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  scripts/kconfig/lxdialog/inputbox.c | 3 ++-
>  scripts/kconfig/nconf.c             | 2 +-
>  scripts/kconfig/nconf.gui.c         | 3 ++-
>  3 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
> index 611945611bf8..1dcfb288ee63 100644
> --- a/scripts/kconfig/lxdialog/inputbox.c
> +++ b/scripts/kconfig/lxdialog/inputbox.c
> @@ -113,7 +113,8 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
>                         case KEY_DOWN:
>                                 break;
>                         case KEY_BACKSPACE:
> -                       case 127:
> +                       case 8:   /* ^H */
> +                       case 127: /* ^? */
>                                 if (pos) {
>                                         wattrset(dialog, dlg.inputbox.atr);
>                                         if (input_x == 0) {
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index a4670f4e825a..ac92c0ded6c5 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
> @@ -1048,7 +1048,7 @@ static int do_match(int key, struct match_state *state, int *ans)
>                 state->match_direction = FIND_NEXT_MATCH_UP;
>                 *ans = get_mext_match(state->pattern,
>                                 state->match_direction);
> -       } else if (key == KEY_BACKSPACE || key == 127) {
> +       } else if (key == KEY_BACKSPACE || key == 8 || key == 127) {
>                 state->pattern[strlen(state->pattern)-1] = '\0';
>                 adj_match_dir(&state->match_direction);
>         } else
> diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
> index 7be620a1fcdb..77f525a8617c 100644
> --- a/scripts/kconfig/nconf.gui.c
> +++ b/scripts/kconfig/nconf.gui.c
> @@ -439,7 +439,8 @@ int dialog_inputbox(WINDOW *main_window,
>                 case KEY_F(F_EXIT):
>                 case KEY_F(F_BACK):
>                         break;
> -               case 127:
> +               case 8:   /* ^H */
> +               case 127: /* ^? */
>                 case KEY_BACKSPACE:
>                         if (cursor_position > 0) {
>                                 memmove(&result[cursor_position-1],
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
