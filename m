Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35044 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbfC2IQD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Mar 2019 04:16:03 -0400
Date: Fri, 29 Mar 2019 08:15:59 +0000
From: Changbin Du <changbin.du@gmail.com>
Subject: Re: [PATCH] kconfig/[mn]conf: handle backspace (^H) key
Message-ID: <20190329081558.u54hczsjheacwvtk@mail.google.com>
References: <20190325151647.11581-1-changbin.du@gmail.com>
 <CAK7LNARkTQoAhjk7qPR4Pn0SHKvW4cvSrtC5brATQ2LbsWegtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARkTQoAhjk7qPR4Pn0SHKvW4cvSrtC5brATQ2LbsWegtw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Changbin Du <changbin.du@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Mar 29, 2019 at 04:50:18PM +0900, Masahiro Yamada wrote:
> On Tue, Mar 26, 2019 at 12:16 AM Changbin Du <changbin.du@gmail.com> wrote:
> >
> > Backspace is not working on some terminal emulators which do not send the
> > key code defined by terminfo. Terminals either send '^H' (8) or '^?' (127).
> > But currently only '$?' is handled.
> 
> 
> 
> Shall I fix '$?' to '^?'
> if it is a typo?
>
yes, please. It is a typo, sorry.

> 
> 
> 
> > Let's also handle '^H' for those
> > terminals.
> >
> > Signed-off-by: Changbin Du <changbin.du@gmail.com>
> > ---
> >  scripts/kconfig/lxdialog/inputbox.c | 3 ++-
> >  scripts/kconfig/nconf.c             | 2 +-
> >  scripts/kconfig/nconf.gui.c         | 3 ++-
> >  3 files changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
> > index 611945611bf8..1dcfb288ee63 100644
> > --- a/scripts/kconfig/lxdialog/inputbox.c
> > +++ b/scripts/kconfig/lxdialog/inputbox.c
> > @@ -113,7 +113,8 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
> >                         case KEY_DOWN:
> >                                 break;
> >                         case KEY_BACKSPACE:
> > -                       case 127:
> > +                       case 8:   /* ^H */
> > +                       case 127: /* ^? */
> >                                 if (pos) {
> >                                         wattrset(dialog, dlg.inputbox.atr);
> >                                         if (input_x == 0) {
> > diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> > index a4670f4e825a..ac92c0ded6c5 100644
> > --- a/scripts/kconfig/nconf.c
> > +++ b/scripts/kconfig/nconf.c
> > @@ -1048,7 +1048,7 @@ static int do_match(int key, struct match_state *state, int *ans)
> >                 state->match_direction = FIND_NEXT_MATCH_UP;
> >                 *ans = get_mext_match(state->pattern,
> >                                 state->match_direction);
> > -       } else if (key == KEY_BACKSPACE || key == 127) {
> > +       } else if (key == KEY_BACKSPACE || key == 8 || key == 127) {
> >                 state->pattern[strlen(state->pattern)-1] = '\0';
> >                 adj_match_dir(&state->match_direction);
> >         } else
> > diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
> > index 7be620a1fcdb..77f525a8617c 100644
> > --- a/scripts/kconfig/nconf.gui.c
> > +++ b/scripts/kconfig/nconf.gui.c
> > @@ -439,7 +439,8 @@ int dialog_inputbox(WINDOW *main_window,
> >                 case KEY_F(F_EXIT):
> >                 case KEY_F(F_BACK):
> >                         break;
> > -               case 127:
> > +               case 8:   /* ^H */
> > +               case 127: /* ^? */
> >                 case KEY_BACKSPACE:
> >                         if (cursor_position > 0) {
> >                                 memmove(&result[cursor_position-1],
> > --
> > 2.17.1
> >
> 
> 
> -- 
> Best Regards
> Masahiro Yamada

-- 
Cheers,
Changbin Du
