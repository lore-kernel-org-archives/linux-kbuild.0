Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:19373 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726726AbgAQCSM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Jan 2020 21:18:12 -0500
MIME-Version: 1.0
References: <20200113232212.138327-1-helgaas@kernel.org>
In-Reply-To: <20200113232212.138327-1-helgaas@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 17 Jan 2020 11:17:15 +0900
Message-ID: <CAK7LNASYynBVaaGROEjy1PC7+9xatO7gf2LTRGG1UOpiXtzENw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix documentation typos
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Randy Dunlap <rdunlap@infradead.org>

On Tue, Jan 14, 2020 at 8:22 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Fix a couple typos in kconfig-language documentation.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  Documentation/kbuild/kconfig-language.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index 74bef19f69f0..f547720bd82d 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -594,7 +594,7 @@ The two different resolutions for b) can be tested in the sample Kconfig file
>  Documentation/kbuild/Kconfig.recursion-issue-02.
>
>  Below is a list of examples of prior fixes for these types of recursive issues;
> -all errors appear to involve one or more select's and one or more "depends on".
> +all errors appear to involve one or more "selects" and one or more "depends on".


I think "selects" is strange here.

"select" is a Kconfig keyword.
select's is intentional, I guess.


Keep it as-is, or perhaps change it into "select" (singular) ?






>
>  ============    ===================================
>  commit          fix
> @@ -656,7 +656,7 @@ the use of the xconfig configurator [1]_. Work should be done to confirm if
>  the deduced semantics matches our intended Kconfig design goals.
>
>  Having well defined semantics can be useful for tools for practical
> -evaluation of depenencies, for instance one such use known case was work to
> +evaluation of dependencies, for instance one such case was work to
>  express in boolean abstraction of the inferred semantics of Kconfig to
>  translate Kconfig logic into boolean formulas and run a SAT solver on this to
>  find dead code / features (always inactive), 114 dead features were found in
> @@ -683,7 +683,7 @@ abstraction the inferred semantics of Kconfig to translate Kconfig logic into
>  boolean formulas and run a SAT solver on it [5]_. Another known related project
>  is CADOS [6]_ (former VAMOS [7]_) and the tools, mainly undertaker [8]_, which
>  has been introduced first with [9]_.  The basic concept of undertaker is to
> -exract variability models from Kconfig, and put them together with a
> +extract variability models from Kconfig and put them together with a
>  propositional formula extracted from CPP #ifdefs and build-rules into a SAT
>  solver in order to find dead code, dead files, and dead symbols. If using a SAT
>  solver is desirable on Kconfig one approach would be to evaluate repurposing
> --
> 2.25.0.rc1.283.g88dfdc4193-goog
>


-- 
Best Regards
Masahiro Yamada
