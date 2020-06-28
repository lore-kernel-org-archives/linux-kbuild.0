Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:26245 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgF1Hxy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 03:53:54 -0400
MIME-Version: 1.0
References: <11c1e65b393b4c3ca6118515c77bbf19524dab11.1593074472.git.hns@goldelico.com>
 <CAK7LNATCLscXNDZ1RUmbnM5BeV-tvKjz9kQB8eo0SNp10WbjFQ@mail.gmail.com> <2D851B90-5F85-4136-AF70-E764FDF4D7DD@goldelico.com>
In-Reply-To: <2D851B90-5F85-4136-AF70-E764FDF4D7DD@goldelico.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 28 Jun 2020 16:52:59 +0900
Message-ID: <CAK7LNARfgaVgmqzsa+n2rvPx5K1dsmcqMLSeLe_tMP0O017=Yw@mail.gmail.com>
Subject: Re: [PATCH] modpost: remove use of non-standard strsep() in HOSTCC code
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>

On Sun, Jun 28, 2020 at 3:17 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> Hi,
>
> > Am 28.06.2020 um 07:51 schrieb Masahiro Yamada <masahiroy@kernel.org>:
> >
> > On Thu, Jun 25, 2020 at 5:47 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >>
> >> strsep() is neither standard C nor POSIX and used outside
> >> the kernel code here. Using it here requires that the
> >> build host supports it out of the box which is e.g.
> >> not true for a Darwin build host and using a cross-compiler.
> >> This leads to:
> >>
> >> scripts/mod/modpost.c:145:2: warning: implicit declaration of function 'strsep' [-Wimplicit-function-declaration]
> >>  return strsep(stringp, "\n");
> >>  ^
> >>
> >> and a segfault when running MODPOST.
> >>
> >> See also: https://stackoverflow.com/a/7219504
> >>
> >> So let's add some lines of code separating the string at the
> >> next newline character instead of using strsep(). It does not
> >> hurt kernel size or speed since this code is run on the build host.
> >>
> >> Fixes: ac5100f5432967 ("modpost: add read_text_file() and get_line() helpers")
> >> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> >> ---
> >> scripts/mod/modpost.c | 7 ++++++-
> >> 1 file changed, 6 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> >> index 6aea65c65745..8fe63989c6e1 100644
> >> --- a/scripts/mod/modpost.c
> >> +++ b/scripts/mod/modpost.c
> >> @@ -138,11 +138,16 @@ char *read_text_file(const char *filename)
> >>
> >> char *get_line(char **stringp)
> >> {
> >> +       char *p;
> >>        /* do not return the unwanted extra line at EOF */
> >>        if (*stringp && **stringp == '\0')
> >
> > This check does not make sense anymore.
> >
> > Previously, get_line(NULL) returns NULL.
> >
> > With your patch, get_line(NULL) crashes
> > due to NULL-pointer dereference.
>
> Well, that is original code.


Sorry for confusion.

I meant this:

  char *s = NULL;
  get_line(&s);


In the current code, get_line(&s) returns NULL.
As 'man strsep' says this:
  "If *stringp is NULL, the strsep() function returns NULL
   and does nothing else."

With your patch, **stringp will cause
NULL-pointer dereference.






>
> I have only replaced the strsep() function.
> But yes, it looks to be better in addition to
> my patch.
>
> >
> >
> >
> >>                return NULL;
> >>
> >> -       return strsep(stringp, "\n");
> >> +       p = *stringp;
> >> +       while (**stringp != '\n')
> >> +               (*stringp)++;
> >
> >
> > Is this a safe conversion?
> >
> > If the input file does not contain '\n' at all,
> > this while-loop continues running,
> > and results in the segmentation fault
> > due to buffer over-run.
>
> Ah, yes, you are right.
>
> We should use
>
> +       while (**stringp && **stringp != '\n')
>
> >
> >
> >
> >> +       *(*stringp)++ = '\0';
> >> +       return p;
> >> }
> >
> >
> >
> > How about this?
> >
> > char *get_line(char **stringp)
> > {
> >        char *orig = *stringp;
>
> ^^^ this still segfaults with get_line(NULL)


This is OK.

get_line(NULL) should crash because we never expect
the case  ' stringp == NULL'.

We need to care about the case ' *stringp == NULL'.
In this case, get_line() should return NULL.




> >        char *next;
> >
> >        /* do not return the unwanted extra line at EOF */
> >        if (!orig || *orig == '\0')
> >                return NULL;
> >
> >        next = strchr(orig, '\n');
> >        if (next)
> >                *next++ = '\0';
> >
> >        *stringp = next;
>
> Yes, this code is easier to understand than my while loop.
> And strchr() is POSIX.
>
> So should I submit an updated patch or do you want to submit
> it (with a suggested-by: H. Nikolaus Schaller <hns@goldelico.com>)

Please send a patch.
(Co-developed-by if you want to give some credit to me)

> BR and thanks,
> Nikolaus Schaller
>
>


--
Best Regards
Masahiro Yamada
