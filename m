Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f176.google.com ([209.85.223.176]:35962 "EHLO
	mail-io0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756385AbcBXWs5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 24 Feb 2016 17:48:57 -0500
Received: by mail-io0-f176.google.com with SMTP id l127so69559002iof.3
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Feb 2016 14:48:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160224232612.e3e41985b1aa52e0e8f373a8@gmail.com>
References: <20160222201335.449323716ca4d929f92424d5@gmail.com>
	<CAGXu5jL0-Kq=paYLsq5KC+cKL1-1U=b_CBLuKQr_KtwG2fqdLg@mail.gmail.com>
	<20160224232612.e3e41985b1aa52e0e8f373a8@gmail.com>
Date: Wed, 24 Feb 2016 14:48:56 -0800
Message-ID: <CAGXu5jLF2pQCH8fKTk=hZ0HyNECXLcWqQbaJAwCNWVYw76=pVA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Introduce GCC plugin infrastructure
From: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Emese Revfy <re.emese@gmail.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, Michal Marek <mmarek@suse.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>

On Wed, Feb 24, 2016 at 2:26 PM, Emese Revfy <re.emese@gmail.com> wrote:
> On Mon, 22 Feb 2016 16:20:40 -0800
> Kees Cook <keescook@chromium.org> wrote:
>
>> characters, function definitions (missing void), and the suggestion to
>> create yourself a MAINTAINTERS line for this directory.
>
> I think the maintainer should be a more experienced kernel developer.
> Would you like to be the maintainer? :)

I'm happy to help ("R:" entry), but I think you should be the
maintainer ("M:" entry) so you're notified if anyone tries to make
changes to the code.

-Kees

-- 
Kees Cook
Chrome OS & Brillo Security
