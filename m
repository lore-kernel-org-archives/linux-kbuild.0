Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f66.google.com ([209.85.166.66]:44550 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbfAYN3w (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Jan 2019 08:29:52 -0500
Received: by mail-io1-f66.google.com with SMTP id r200so7696607iod.11
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Jan 2019 05:29:51 -0800 (PST)
MIME-Version: 1.0
References: <1547765160-15502-1-git-send-email-eugene.loh@oracle.com> <CAKv+Gu8BeYsq-_7KiANOjSN2fp25BP=71uLqKnkkYYJdhD2Bfw@mail.gmail.com>
In-Reply-To: <CAKv+Gu8BeYsq-_7KiANOjSN2fp25BP=71uLqKnkkYYJdhD2Bfw@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Fri, 25 Jan 2019 14:29:40 +0100
Message-ID: <CAKv+Gu_6_K0ZrRLMST6bYxqgSfhDJACoiArQg+K3pFaYjJxQsA@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: Handle too long symbols in kallsyms.c
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: eugene.loh@oracle.com, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andi Kleen <ak@linux.intel.com>, andi@firstfloor.org

(+ masahiro)

On Fri, 25 Jan 2019 at 14:28, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
> On Thu, 17 Jan 2019 at 23:46, <eugene.loh@oracle.com> wrote:
> >
> > From: Eugene Loh <eugene.loh@oracle.com>
> >
> > When checking for symbols with excessively long names,
> > account for null terminating character.
> >
> > Fixes: f3462aa952cf ("Kbuild: Handle longer symbols in kallsyms.c")
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>
> Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>
> > ---
> >  scripts/kallsyms.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> > index 77cebad..f75e7bd 100644
> > --- a/scripts/kallsyms.c
> > +++ b/scripts/kallsyms.c
> > @@ -118,8 +118,8 @@ static int read_symbol(FILE *in, struct sym_entry *s)
> >                         fprintf(stderr, "Read error or end of file.\n");
> >                 return -1;
> >         }
> > -       if (strlen(sym) > KSYM_NAME_LEN) {
> > -               fprintf(stderr, "Symbol %s too long for kallsyms (%zu vs %d).\n"
> > +       if (strlen(sym) >= KSYM_NAME_LEN) {
> > +               fprintf(stderr, "Symbol %s too long for kallsyms (%zu >= %d).\n"
> >                                 "Please increase KSYM_NAME_LEN both in kernel and kallsyms.c\n",
> >                         sym, strlen(sym), KSYM_NAME_LEN);
> >                 return -1;
> > --
> > 1.8.3.1
> >
