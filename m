Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36696 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750850AbcBYWrh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 25 Feb 2016 17:47:37 -0500
Received: by mail-wm0-f67.google.com with SMTP id a4so6117447wme.3
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Feb 2016 14:47:36 -0800 (PST)
Date: Thu, 25 Feb 2016 23:45:42 +0100
From: Emese Revfy <re.emese@gmail.com>
Subject: Re: [PATCH v3 0/3] Introduce GCC plugin infrastructure
Message-Id: <20160225234542.3c02b799b9715fdbd3e9de93@gmail.com>
In-Reply-To: <CAGXu5jL0-Kq=paYLsq5KC+cKL1-1U=b_CBLuKQr_KtwG2fqdLg@mail.gmail.com>
References: <20160222201335.449323716ca4d929f92424d5@gmail.com>
	<CAGXu5jL0-Kq=paYLsq5KC+cKL1-1U=b_CBLuKQr_KtwG2fqdLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, Michal Marek <mmarek@suse.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>

On Mon, 22 Feb 2016 16:20:40 -0800
Kees Cook <keescook@chromium.org> wrote:
> Running each patch through scripts/checkpatch.pl produces a number of
> other warnings (I ignored all the C++isms), mostly around lines >80
> characters, function definitions (missing void), and the suggestion to

I fixed only those >80 line type warnings that didn't impair the readability of the code:
https://github.com/ephox-gcc-plugins/gcc-plugins_linux-next/commit/77c8e286fb

-- 
Emese
