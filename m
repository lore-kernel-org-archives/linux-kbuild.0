Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:63568 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753400AbdKJScU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Nov 2017 13:32:20 -0500
Subject: Re: [PATCH 00/10] scripts/basic: Fine-tuning for seven function
 implementations
From: SF Markus Elfring <elfring@users.sourceforge.net>
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
Message-ID: <9fcfb92e-2362-7111-e68f-5f6de02648e3@users.sourceforge.net>
Date: Fri, 10 Nov 2017 19:32:10 +0100
MIME-Version: 1.0
In-Reply-To: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Jim Davis <jim.epost@gmail.com>

> Date: Fri, 28 Oct 2016 10:18:10 +0200
> 
> Some update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (10):
>   bin2c: Complete error handling in main()
>   fixdep: Complete error handling in print_deps()
>   fixdep: Use the symbol "MAP_FAILED" in print_deps()
>   fixdep: Fix error log output in print_deps()
>   fixdep: Complete error handling in parse_dep_file()
>   fixdep: Complete error handling in do_config_file()
>   fixdep: Fix error log output in do_config_file()
>   fixdep: Complete error handling in print_config()
>   fixdep: Complete error handling in print_cmdline()
>   fixdep: Combine two fprintf() calls into one fputs() call in usage()
> 
>  scripts/basic/bin2c.c  |  26 ++++++----
>  scripts/basic/fixdep.c | 131 +++++++++++++++++++++++++++++++++----------------
>  2 files changed, 105 insertions(+), 52 deletions(-)

Are these update suggestions worth for another look?
https://lkml.org/lkml/2016/10/28/138

Regards,
Markus
