Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ms.lwn.net ([45.79.88.28]:39732 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727721AbfCEOoP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Mar 2019 09:44:15 -0500
Date: Tue, 5 Mar 2019 07:44:13 -0700
From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 2/3] objtool: move stack-validation.txt to
 Documentation/
Message-ID: <20190305074413.5f72ecc1@lwn.net>
In-Reply-To: <1551764896-8453-2-git-send-email-yamada.masahiro@socionext.com>
References: <1551764896-8453-1-git-send-email-yamada.masahiro@socionext.com>
        <1551764896-8453-2-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Douglas Anderson <dianders@chromium.org>, Robin Meijboom <robin@meijboom.info>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue,  5 Mar 2019 14:48:15 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Move the document to the standard Documentation/ directory instead of
> creating the same directory structure under objtool/.

This seems like a good idea to me, but can I make a couple of requests?

 - Convert it to RST while you're at it?  It's 99% there already.

 - Let's not add it to the top-level Documentation/ mess; I'm slowly
   trying to bring some order there.  Perhaps a better home would be
   Documentation/kbuild/ ?

Thanks,

jon
