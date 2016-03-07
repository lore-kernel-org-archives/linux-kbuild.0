Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35344 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753744AbcCGVed (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 7 Mar 2016 16:34:33 -0500
Date: Mon, 7 Mar 2016 22:32:35 +0100
From: Emese Revfy <re.emese@gmail.com>
Subject: Re: [PATCH v5 1/5] Shared library support
Message-Id: <20160307223235.268a3da1c8f766474dbd3ce8@gmail.com>
In-Reply-To: <CAGXu5j+BH-0rOP-rsZWCXGftAfOe-bqa4+L0Wj1kBddDvTT5_Q@mail.gmail.com>
References: <20160307000208.1bec3e7dc874489d1b4fcbb4@gmail.com>
	<20160307000329.a51b2b8f4fdb0e60344f0b20@gmail.com>
	<CAGXu5j+BH-0rOP-rsZWCXGftAfOe-bqa4+L0Wj1kBddDvTT5_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, Michal Marek <mmarek@suse.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Fengguang Wu <fengguang.wu@intel.com>, Dmitry Vyukov <dvyukov@google.com>, LKML <linux-kernel@vger.kernel.org>

On Mon, 7 Mar 2016 13:05:16 -0800
Kees Cook <keescook@chromium.org> wrote:

> On Sun, Mar 6, 2016 at 3:03 PM, Emese Revfy <re.emese@gmail.com> wrote:
> > Infrastructure for building independent shared library targets.
> > This effectively also reverts commit 62e2210798ed38928ab24841e8b4878a
> > (Masahiro Yamada, kbuild: drop shared library support from Makefile.host).
> 
> Should this literally be a revert? If so, we'd gain the Documentation
> changes back too.

Sure, I'll do it in the next patch set.

-- 
Emese
