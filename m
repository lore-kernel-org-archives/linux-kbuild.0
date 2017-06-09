Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:18201 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751505AbdFIIfZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Jun 2017 04:35:25 -0400
MIME-Version: 1.0
In-Reply-To: <1496996992-17857-1-git-send-email-yamada.masahiro@socionext.com>
References: <1496996992-17857-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 9 Jun 2017 17:35:13 +0900
Message-ID: <CAK7LNAQYfJxJEazU+pTqOFBuB3YzCH96ZmHn7wPK9V-XTuPgnA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: replace genhdr-y with generated-y, deprecating genhdr-y
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Nicolas Dichtel <nicolas.dichtel@6wind.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Michal Marek <mmarek@suse.com>, Michael Ellerman <mpe@ellerman.id.au>, X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, linux-doc@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Ingo Molnar <mingo@redhat.com>, Russell King <linux@armlinux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-06-09 17:29 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Prior to commit fcc8487d477a ("uapi: export all headers under uapi
> directories"), genhdr-y was meant to specify generated UAPI headers.
>
> - generated-y: generated headers (other than asm-generic wrappers)
> - header-y   : headers to be exported
> - genhdr-y   : generated headers to be exported (generated-y + header-y)
>
> Now headers under UAPI directories are all exported.  So, there is no
> more difference between generated-y and genhdr-y.
>
> We see two users of genhdr-y, arch/{arm,x86}/include/uapi/asm/Kbuild.
> They generate some headers in arch/{arm,x86}/include/uapi/generated/

The correct path is arch/{arm,x86}/include/generated/uapi/

I will fix it.



-- 
Best Regards
Masahiro Yamada
