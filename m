Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f66.google.com ([209.85.166.66]:33083 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgAQEHg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Jan 2020 23:07:36 -0500
MIME-Version: 1.0
References: <20200113232212.138327-1-helgaas@kernel.org> <CAK7LNASYynBVaaGROEjy1PC7+9xatO7gf2LTRGG1UOpiXtzENw@mail.gmail.com>
In-Reply-To: <CAK7LNASYynBVaaGROEjy1PC7+9xatO7gf2LTRGG1UOpiXtzENw@mail.gmail.com>
Reply-To: bjorn@helgaas.com
From: Bjorn Helgaas <bjorn.helgaas@gmail.com>
Date: Thu, 16 Jan 2020 22:07:24 -0600
Message-ID: <CABhMZUVjx-z51FkCNPTKzP3=8m4CBM3cp57ZvMBcMXTfA6ARKw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix documentation typos
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Randy Dunlap <rdunlap@infradead.org>

On Thu, Jan 16, 2020 at 8:18 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Jan 14, 2020 at 8:22 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > From: Bjorn Helgaas <bhelgaas@google.com>
> >
> > Fix a couple typos in kconfig-language documentation.
> >
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > ---
> >  Documentation/kbuild/kconfig-language.rst | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> > index 74bef19f69f0..f547720bd82d 100644
> > --- a/Documentation/kbuild/kconfig-language.rst
> > +++ b/Documentation/kbuild/kconfig-language.rst
> > @@ -594,7 +594,7 @@ The two different resolutions for b) can be tested in the sample Kconfig file
> >  Documentation/kbuild/Kconfig.recursion-issue-02.
> >
> >  Below is a list of examples of prior fixes for these types of recursive issues;
> > -all errors appear to involve one or more select's and one or more "depends on".
> > +all errors appear to involve one or more "selects" and one or more "depends on".
>
>
> I think "selects" is strange here.
>
> "select" is a Kconfig keyword.
> select's is intentional, I guess.
>
>
> Keep it as-is, or perhaps change it into "select" (singular) ?

With rare exceptions, apostrophes are not used to form a plural noun.

Maybe it could be recast as "... at least one 'select' attribute and
at least one 'depends on' attribute"?

I'm not quite sure what the intended meaning is, because the table it
refers to has lines that contain only "depends on" (without "select")
and also lines that contain only "select" (no "depends on").


> >  ============    ===================================
> >  commit          fix
> > @@ -656,7 +656,7 @@ the use of the xconfig configurator [1]_. Work should be done to confirm if
> >  the deduced semantics matches our intended Kconfig design goals.
> >
> >  Having well defined semantics can be useful for tools for practical
> > -evaluation of depenencies, for instance one such use known case was work to
> > +evaluation of dependencies, for instance one such case was work to
> >  express in boolean abstraction of the inferred semantics of Kconfig to
> >  translate Kconfig logic into boolean formulas and run a SAT solver on this to
> >  find dead code / features (always inactive), 114 dead features were found in
> > @@ -683,7 +683,7 @@ abstraction the inferred semantics of Kconfig to translate Kconfig logic into
> >  boolean formulas and run a SAT solver on it [5]_. Another known related project
> >  is CADOS [6]_ (former VAMOS [7]_) and the tools, mainly undertaker [8]_, which
> >  has been introduced first with [9]_.  The basic concept of undertaker is to
> > -exract variability models from Kconfig, and put them together with a
> > +extract variability models from Kconfig and put them together with a
> >  propositional formula extracted from CPP #ifdefs and build-rules into a SAT
> >  solver in order to find dead code, dead files, and dead symbols. If using a SAT
> >  solver is desirable on Kconfig one approach would be to evaluate repurposing
> > --
> > 2.25.0.rc1.283.g88dfdc4193-goog
> >
>
>
> --
> Best Regards
> Masahiro Yamada
