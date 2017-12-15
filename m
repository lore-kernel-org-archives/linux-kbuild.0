Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:43442 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755506AbdLORaW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Dec 2017 12:30:22 -0500
Date: Fri, 15 Dec 2017 18:30:21 +0100
From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [PATCH 2/2] kconfig: drop 'boolean' keyword
Message-ID: <20171215173021.GC729@wotan.suse.de>
References: <1513352282-4437-1-git-send-email-yamada.masahiro@socionext.com>
 <1513352282-4437-2-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1513352282-4437-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org

On Sat, Dec 16, 2017 at 12:38:02AM +0900, Masahiro Yamada wrote:
> No more users of this keyword.  Drop it according to the notice by
> commit 6341e62b212a ("kconfig: use bool instead of boolean for type
> definition attributes").
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Provided you get 0-day test it without complaints:

Acked-by: Luis R. Rodriguez <mcgrof@kernel.org>

  Luis
