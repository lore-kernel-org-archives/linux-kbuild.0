Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:36526 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756988AbcBRVXq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 18 Feb 2016 16:23:46 -0500
Received: by mail-wm0-f50.google.com with SMTP id g62so48381556wme.1
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Feb 2016 13:23:45 -0800 (PST)
Date: Thu, 18 Feb 2016 22:21:55 +0100
From: Emese Revfy <re.emese@gmail.com>
Subject: Re: [PATCH v2 1/3] GCC plugin infrastructure
Message-Id: <20160218222155.85bf19be5ab9c48efc2fec66@gmail.com>
In-Reply-To: <CAGXu5jJcxDObPaVN25Keru6Gj9jo=EgvzhrLUUPcC0pki8pp_g@mail.gmail.com>
References: <20160211233646.97c2af3675dc5b0f525f0489@gmail.com>
	<20160211233903.d976f6d4457d8fe414158824@gmail.com>
	<CAGXu5jJcxDObPaVN25Keru6Gj9jo=EgvzhrLUUPcC0pki8pp_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, Michal Marek <mmarek@suse.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>

 
> > +ifeq ($(call cc-ifversion, -ge, 0408, y), y)
> > +       $(CONFIG_SHELL) -x $(srctree)/scripts/gcc-plugin.sh "$(HOSTCXX)" "$(HOSTCXX)" "$(CC)"
> > +else
> > +       $(CONFIG_SHELL) -x $(srctree)/scripts/gcc-plugin.sh "$(HOSTCC)" "$(HOSTCXX)" "$(CC)"
> 
> Is there a reason for these to be running with -x? This makes it noisy
> when running with V=0 (the default).

I think -x is useful, it prints out e.g., which headers are missing. gcc-plugin.sh with -x runs
only when there is something wrong (as you can see it in the kbuild test bot mails).

-- 
Emese
