Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34233 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751112AbcCBU7G (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Mar 2016 15:59:06 -0500
Received: by mail-wm0-f68.google.com with SMTP id p65so769314wmp.1
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Mar 2016 12:59:05 -0800 (PST)
Date: Wed, 2 Mar 2016 21:57:11 +0100
From: Emese Revfy <re.emese@gmail.com>
Subject: Re: [PATCH v4 1/3] GCC plugin infrastructure
Message-Id: <20160302215711.7ba0301691f3eb3f5316b861@gmail.com>
In-Reply-To: <CAGXu5j+gTWR_ZMk6nMzMZRfTvvi7VXg5ngoHx6cC+r-fe1OgNA@mail.gmail.com>
References: <20160301181400.9c623ee9230381da90b89b2a@gmail.com>
	<20160301181514.dc3dadeb7e18b77a09dddb7f@gmail.com>
	<CAGXu5j+gTWR_ZMk6nMzMZRfTvvi7VXg5ngoHx6cC+r-fe1OgNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, Michal Marek <mmarek@suse.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Fengguang Wu <fengguang.wu@intel.com>

On Tue, 1 Mar 2016 11:07:25 -0800
Kees Cook <keescook@chromium.org> wrote:

> I wonder if it might make sense to split the .so-building logic
> changes from the gcc plugin changes to make things more readable for
> review? Personally, I'm fine with this as-is, but it might benefit
> other reviewers, if it's a sane split.

I will split this patch in the next patch set.

> > +GCC PLUGINS
> > +M:     Kees Cook <keescook@chromium.org>
> > +R:     Emese Revfy <re.emese@gmail.com>
> > +L:     kernel-hardening@lists.openwall.com
> > +S:     Maintained
> > +F:     tools/gcc
> 
> I think that needs a trailing slash to indicate it's a tree to match.

I tested it with get_maintainer.pl and it is good.

> > +F:     Documentation/gcc-plugins.txt
> 
> I wonder if this should be moved to Documentation/kbuild/ ?

I don't know. Michal Marek, could you please tell me where I should put the documentation? 

-- 
Emese
