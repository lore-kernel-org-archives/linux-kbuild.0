Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:22009 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750737AbdECEmS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 May 2017 00:42:18 -0400
MIME-Version: 1.0
In-Reply-To: <20170421151620.14297-1-jslaby@suse.cz>
References: <20170421151620.14297-1-jslaby@suse.cz>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 3 May 2017 13:42:12 +0900
Message-ID: <CAK7LNARBQA3caNHXOsjWjvjdphExFyXjdvum7uUML9xGqDALdw@mail.gmail.com>
Subject: Re: [PATCH 1/1] objtool: make it visible in make V=1 output
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiri Slaby <jslaby@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>

2017-04-22 0:16 GMT+09:00 Jiri Slaby <jslaby@suse.cz>:
> It is currently impossible to see what is going on with objtool when
> building, so call echo-cmd to see the actions:
>   gcc -Wp,-MD,arch/x86/entry/.entry_64.o.d  -nostdinc -isystem ...
>   ./tools/objtool/objtool check "arch/x86/entry/entry_64.o";
>
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <mmarek@suse.com>
> Cc: linux-kbuild@vger.kernel.org
> Cc: Josh Poimboeuf <jpoimboe@redhat.com>
> ---


Applied to linux-kbuild/kbuild.  Thanks!


-- 
Best Regards
Masahiro Yamada
