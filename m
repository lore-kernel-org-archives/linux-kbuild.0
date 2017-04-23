Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:59651 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1427541AbdDWHBS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 Apr 2017 03:01:18 -0400
MIME-Version: 1.0
In-Reply-To: <1492755671-19005-1-git-send-email-yamada.masahiro@socionext.com>
References: <1492755671-19005-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 23 Apr 2017 16:01:10 +0900
Message-ID: <CAK7LNAQu_FTYL3250mRGhmG-u-nHFVwx_-H+4-ffUvjuGdXhNQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] kbuild: cleanup asm-offset generation, and make it
 work with clang
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Matthias Kaehlcke <mka@chromium.org>, David Howells <dhowells@redhat.com>, Michael Davidson <md@google.com>, Michal Marek <mmarek@suse.com>, Jan Beulich <JBeulich@novell.com>, Alexander van Heukelum <heukelum@fastmail.fm>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jeroen Hofstee <jeroen@myspectrum.nl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-04-21 15:21 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> 1/2 is a trivial cleanup of sed script
>
> 2/2 imports clang work-around from U-Boot.


Series, applied to linux-kbuild/kbuild.


-- 
Best Regards
Masahiro Yamada
