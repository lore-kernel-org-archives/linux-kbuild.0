Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:47878 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729081AbgAUPzC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Jan 2020 10:55:02 -0500
MIME-Version: 1.0
References: <20200117161822.106635-1-helgaas@kernel.org>
In-Reply-To: <20200117161822.106635-1-helgaas@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 22 Jan 2020 00:54:08 +0900
Message-ID: <CAK7LNAT4kVw1iE7zSypJ1wLnrrEEfRRd5YfH4m6aeXymF_2BfA@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: fix documentation typos
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>

On Sat, Jan 18, 2020 at 1:18 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Fix a couple typos in kconfig-language documentation.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---

Applied to linux-kbuild.
Thanks.


>  Documentation/kbuild/kconfig-language.rst | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index 74bef19f69f0..0148ae82446e 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -594,7 +594,8 @@ The two different resolutions for b) can be tested in the sample Kconfig file
>  Documentation/kbuild/Kconfig.recursion-issue-02.
>
>  Below is a list of examples of prior fixes for these types of recursive issues;
> -all errors appear to involve one or more select's and one or more "depends on".
> +all errors appear to involve one or more "select" statements and one or more
> +"depends on".
>
>  ============    ===================================
>  commit          fix
> @@ -656,7 +657,7 @@ the use of the xconfig configurator [1]_. Work should be done to confirm if
>  the deduced semantics matches our intended Kconfig design goals.
>
>  Having well defined semantics can be useful for tools for practical
> -evaluation of depenencies, for instance one such use known case was work to
> +evaluation of dependencies, for instance one such case was work to
>  express in boolean abstraction of the inferred semantics of Kconfig to
>  translate Kconfig logic into boolean formulas and run a SAT solver on this to
>  find dead code / features (always inactive), 114 dead features were found in
> @@ -683,7 +684,7 @@ abstraction the inferred semantics of Kconfig to translate Kconfig logic into
>  boolean formulas and run a SAT solver on it [5]_. Another known related project
>  is CADOS [6]_ (former VAMOS [7]_) and the tools, mainly undertaker [8]_, which
>  has been introduced first with [9]_.  The basic concept of undertaker is to
> -exract variability models from Kconfig, and put them together with a
> +extract variability models from Kconfig and put them together with a
>  propositional formula extracted from CPP #ifdefs and build-rules into a SAT
>  solver in order to find dead code, dead files, and dead symbols. If using a SAT
>  solver is desirable on Kconfig one approach would be to evaluate repurposing
> --
> 2.25.0.341.g760bfbb309-goog
>


-- 
Best Regards
Masahiro Yamada
