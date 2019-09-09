Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pb-smtp2.pobox.com ([64.147.108.71]:64220 "EHLO
        pb-smtp2.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727854AbfIINsU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Sep 2019 09:48:20 -0400
Date: Mon, 9 Sep 2019 09:48:17 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH 1/2] export.h: remove defined(__KERNEL__)
In-Reply-To: <20190909105317.20473-1-yamada.masahiro@socionext.com>
Message-ID: <nycvar.YSQ.7.76.1909090942420.3091@knanqh.ubzr>
References: <20190909105317.20473-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Denis Efremov <efremov@linux.com>, linux-kernel@vger.kernel.org

On Mon, 9 Sep 2019, Masahiro Yamada wrote:

> This line was touched by commit f235541699bc ("export.h: allow for
> per-symbol configurable EXPORT_SYMBOL()"), but the commit log did
> not explain why.
> 
> CONFIG_TRIM_UNUSED_KSYMS works for me without defined(__KERNEL__).

I'm pretty sure it was needed back then so not to interfere with users 
of this file. My fault for not documenting it.


Nicolas
