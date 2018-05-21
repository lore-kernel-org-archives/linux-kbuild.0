Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:37268 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751039AbeEUHOS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 May 2018 03:14:18 -0400
Date: Mon, 21 May 2018 09:14:14 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 07/31] kconfig: add built-in function support
Message-ID: <20180521071414.GA9397@ravnborg.org>
References: <1526537830-22606-1-git-send-email-yamada.masahiro@socionext.com>
 <1526537830-22606-8-git-send-email-yamada.masahiro@socionext.com>
 <20180520145031.GB9826@ravnborg.org>
 <CAK7LNATM6s++TJ-VrbSwoMmP5FgVOmkUNGCwzZW=Re0WEr5EYQ@mail.gmail.com>
 <20180521061613.GA21232@ravnborg.org>
 <CAK7LNATw1VRjX9CcJVdAzi7YDhmMFpxmBQqs_PPSKJdMbAD=pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATw1VRjX9CcJVdAzi7YDhmMFpxmBQqs_PPSKJdMbAD=pg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Ulf Magnusson <ulfalizer@gmail.com>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Kees Cook <keescook@chromium.org>, Emese Revfy <re.emese@gmail.com>, X86 ML <x86@kernel.org>

Hi Masahiro,

> Hmm, your suggestion is more shell-oriented parsing.
...
> Probably, I found it was much more complex,
> then I chose Make-like simpler one.

Agree that the simple one should be the best choice for now.
We shall not add anything more complex unless it is really needed.

	Sam
