Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:33394 "EHLO
	mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1426696AbcBRWPH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 18 Feb 2016 17:15:07 -0500
Received: by mail-wm0-f43.google.com with SMTP id g62so44959054wme.0
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Feb 2016 14:15:06 -0800 (PST)
Date: Thu, 18 Feb 2016 23:13:15 +0100
From: Emese Revfy <re.emese@gmail.com>
Subject: Re: [PATCH v2 3/3] Documentation for the GCC plugin infrastructure
Message-Id: <20160218231315.b1edfb403c1dc6eb0d0a20df@gmail.com>
In-Reply-To: <CAGXu5j+1OQ81cxU57s_h_T60Z0ng54+X_jDtSdUePPQ7_Ak0Jg@mail.gmail.com>
References: <20160211233646.97c2af3675dc5b0f525f0489@gmail.com>
	<20160211234301.84a5ff8e513f5d5f78478283@gmail.com>
	<CAGXu5j+1OQ81cxU57s_h_T60Z0ng54+X_jDtSdUePPQ7_Ak0Jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, Michal Marek <mmarek@suse.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>

On Wed, 17 Feb 2016 16:35:15 -0800
Kees Cook <keescook@chromium.org> wrote:

> > +Currently the GCC plugin infrastructure supports only the x86 architecture.
> 
> What's needed to support other architectures?

Sadly gcc doesn't always install all necessary plugin headers (moreover some headers
come from the build tree). The gcc developers don't test gcc with installed headers
so they don't see these bugs.
I think arm support would be good. I can test it easily because I know what headers are
missing there but I don't know if it is acceptable for the vanilla kernel (installing
the headers by hand isn't too nice and user friendly).

> The part about the proper host compiler isn't clear to me. It looks
> like each of three compilers are examined:
> $CC for the header location
> $HOSTCC for actually doing the build, or
> $HOSTCXX for doing the plugin build?

$HOSTCC and $HOSTCXX are used for building a plugin. Their use depends on which gcc version
(c or c++ based) you use.

> Shouldn't the headers be coming from the compiler that is actually
> going to be used to build the .so file?

No, they have to come from the compiler that will load the plugin (the plugin itself
could even be compiled by clang for example).

-- 
Emese
