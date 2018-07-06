Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:21503 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753439AbeGFAjy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jul 2018 20:39:54 -0400
MIME-Version: 1.0
In-Reply-To: <53a0c9d4-cf1c-fbcf-3706-742f5ad41178@infradead.org>
References: <53a0c9d4-cf1c-fbcf-3706-742f5ad41178@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 6 Jul 2018 09:38:52 +0900
Message-ID: <CAK7LNASPOrhUCTwCXTbrVbjwh+AHoPkHcmJ5mzC24wU8hwsM2w@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: verify that $DEPMOD is installed
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Jessica Yu <jeyu@kernel.org>, Chih-Wei Huang <cwhuang@linux.org.tw>

2018-07-02 11:46 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Verify that 'depmod' ($DEPMOD) is installed.
> This is a partial revert of 620c231c7a7f (from 2012):
>   ("kbuild: do not check for ancient modutils tools")
>
> Also update Documentation/process/changes.rst to refer to
> kmod instead of module-init-tools.
>
> Fixes kernel bugzilla #198965:
> https://bugzilla.kernel.org/show_bug.cgi?id=198965
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Lucas De Marchi <lucas.demarchi@profusion.mobi>
> Cc: Lucas De Marchi <lucas.de.marchi@gmail.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Jessica Yu <jeyu@kernel.org>
> Cc: Chih-Wei Huang <cwhuang@linux.org.tw>
> Cc: stable@vger.kernel.org # any kernel since 2012

Applied to linux-kbuild. Thanks!




-- 
Best Regards
Masahiro Yamada
