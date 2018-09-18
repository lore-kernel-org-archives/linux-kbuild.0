Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lithops.sigma-star.at ([195.201.40.130]:57102 "EHLO
        lithops.sigma-star.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728842AbeIRNw4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Sep 2018 09:52:56 -0400
From: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] samples: disable CONFIG_SAMPLES for UML
Date: Tue, 18 Sep 2018 10:21:22 +0200
Message-ID: <2024081.XhWFmWp6tJ@blindfold>
In-Reply-To: <1537243113-1710-1-git-send-email-yamada.masahiro@socionext.com>
References: <1537243113-1710-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org, David Howells <dhowells@redhat.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Alex Williamson <alex.williamson@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>

Am Dienstag, 18. September 2018, 05:58:33 CEST schrieb Masahiro Yamada:
> Some samples require headers installation, so commit 3fca1700c4c3
> ("kbuild: make samples really depend on headers_install") added
> such dependency in the top Makefile.  However, UML fails to build
> with CONFIG_SAMPLES=y because UML does not support headers_install.
> 
> Fixes: 3fca1700c4c3 ("kbuild: make samples really depend on headers_install")
> Reported-by: Kees Cook <keescook@chromium.org>
> Cc: David Howells <dhowells@redhat.com>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Is there anything UML can do better?
Not sure whether an arch like is supposed to install headers at all,
I guess no. :)

Thanks,
//richard
