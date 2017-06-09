Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f172.google.com ([209.85.128.172]:35057 "EHLO
        mail-wr0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751527AbdFIOMe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Jun 2017 10:12:34 -0400
Received: by mail-wr0-f172.google.com with SMTP id q97so34747947wrb.2
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Jun 2017 07:12:34 -0700 (PDT)
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH] kbuild: replace genhdr-y with generated-y, deprecating
 genhdr-y
References: <1496996992-17857-1-git-send-email-yamada.masahiro@socionext.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Message-ID: <40a662b5-055b-b5ac-cebe-39b417b677de@6wind.com>
Date: Fri, 9 Jun 2017 16:12:29 +0200
MIME-Version: 1.0
In-Reply-To: <1496996992-17857-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Michal Marek <mmarek@suse.com>, Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ingo Molnar <mingo@redhat.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org

Le 09/06/2017 à 10:29, Masahiro Yamada a écrit :
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
> directories, which are obviously exported.
> 
> Replace genhdr-y with generated-y, and deprecate genhdr-y.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Good catch. It eases the understanding of all those mechanisms.

After the fix of the typo in the commitlog:
Acked-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
