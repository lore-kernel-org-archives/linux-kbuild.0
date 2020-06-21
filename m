Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0207.hostedemail.com ([216.40.44.207]:45460 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729279AbgFUTM4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Jun 2020 15:12:56 -0400
Message-ID: <cb10e0a1a35e7dfc4f6a27dacb7883eaa3864811.camel@perches.com>
Subject: Re: kbuild: separate kerneldoc warnings from compiler warnings
From: Joe Perches <joe@perches.com>
Date: Sun, 21 Jun 2020 12:12:53 -0700
In-Reply-To: <591473.1592679153@turing-police>
References: <591473.1592679153@turing-police>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 2020-06-20 at 14:52 -0400, Valdis Klētnieks wrote:
> This patch introduces a new build flag 'K=1' which controls whether kerneldoc
> warnings should be issued, separating them from the compiler warnings that W=
> controls.
[]
> diff --git a/Makefile b/Makefile
[]
> @@ -1605,6 +1605,7 @@ PHONY += help
>  	@echo  '                       (sparse by default)'
>  	@echo  '  make C=2   [targets] Force check of all c source with $$CHECK'
>  	@echo  '  make RECORDMCOUNT_WARN=1 [targets] Warn about ignored mcount sections'
> +	@echo  '  make K=1   [targets] Warn about problems in kerneldoc comments'

Seems sensible. Thanks.
