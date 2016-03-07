Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172]:38474 "EHLO
	mail-ig0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753103AbcCGVFR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 7 Mar 2016 16:05:17 -0500
Received: by mail-ig0-f172.google.com with SMTP id ig19so1597534igb.1
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Mar 2016 13:05:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160307000329.a51b2b8f4fdb0e60344f0b20@gmail.com>
References: <20160307000208.1bec3e7dc874489d1b4fcbb4@gmail.com>
	<20160307000329.a51b2b8f4fdb0e60344f0b20@gmail.com>
Date: Mon, 7 Mar 2016 13:05:16 -0800
Message-ID: <CAGXu5j+BH-0rOP-rsZWCXGftAfOe-bqa4+L0Wj1kBddDvTT5_Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] Shared library support
From: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Emese Revfy <re.emese@gmail.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, Michal Marek <mmarek@suse.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Fengguang Wu <fengguang.wu@intel.com>, Dmitry Vyukov <dvyukov@google.com>, LKML <linux-kernel@vger.kernel.org>

On Sun, Mar 6, 2016 at 3:03 PM, Emese Revfy <re.emese@gmail.com> wrote:
> Infrastructure for building independent shared library targets.
> This effectively also reverts commit 62e2210798ed38928ab24841e8b4878a
> (Masahiro Yamada, kbuild: drop shared library support from Makefile.host).

Should this literally be a revert? If so, we'd gain the Documentation
changes back too.

-Kees

>
> Signed-off-by: Emese Revfy <re.emese@gmail.com>
> ---
>  scripts/Makefile.build |  2 +-
>  scripts/Makefile.clean |  3 ++-
>  scripts/Makefile.host  | 69 +++++++++++++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 71 insertions(+), 3 deletions(-)

-- 
Kees Cook
Chrome OS & Brillo Security
