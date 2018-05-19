Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:56344 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752451AbeESSKC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 May 2018 14:10:02 -0400
Subject: Re: [PATCH 2/5] kconfig: refactor Qt package checks for building
 qconf
References: <1526619146-1895-1-git-send-email-yamada.masahiro@socionext.com>
 <1526619146-1895-3-git-send-email-yamada.masahiro@socionext.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7832d660-d44a-38a7-4924-6e81e07eb3fa@infradead.org>
Date: Sat, 19 May 2018 11:10:00 -0700
MIME-Version: 1.0
In-Reply-To: <1526619146-1895-3-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org

On 05/17/18 21:52, Masahiro Yamada wrote:
> Currently, the necessary package checks for building qconf is
> surrounded by ifeq ($(MAKECMDGOALS),xconfig) ... endif.
> Then, Make will restart when .tmp_qtcheck is generated.
> 
> To simplify the Makefile, move the scripting to a separate file,
> and use filechk.  The shell script is executed everytime xconfig
> is run, but it is not a costly script.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

This one works for me.

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>


thanks.
-- 
~Randy
