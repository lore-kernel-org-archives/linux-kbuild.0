Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34716 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755856AbcCPVIL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Mar 2016 17:08:11 -0400
Date: Wed, 16 Mar 2016 22:06:02 +0100
From: Emese Revfy <re.emese@gmail.com>
Subject: Re: [PATCH v5 2/5] GCC plugin infrastructure
Message-Id: <20160316220602.5269b38c162daa97f3cbe044@gmail.com>
In-Reply-To: <CAK7LNARDyW3Si45rUaUpHhhmqO4hmN-mTdVK4zxqg23cuByAtQ@mail.gmail.com>
References: <20160307000208.1bec3e7dc874489d1b4fcbb4@gmail.com>
	<20160307000427.c82f18670568e1e656fc9532@gmail.com>
	<CAK7LNASCOaEi46+b7Obt0D6GtiBmCfwBEkdbYSnpBDzzQOXpvA@mail.gmail.com>
	<20160314215217.7fa20e0c85bfda75dc11b70c@gmail.com>
	<CAK7LNARDyW3Si45rUaUpHhhmqO4hmN-mTdVK4zxqg23cuByAtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, pageexec@freemail.hu, spender@grsecurity.net, kernel-hardening@lists.openwall.com, Michal Marek <mmarek@suse.com>, Kees Cook <keescook@chromium.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, fengguang.wu@intel.com, Dmitry Vyukov <dvyukov@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, 16 Mar 2016 16:41:36 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> > The scripts name also doesn't describe gcc plugins well.
> 
> With my suggestion "scripts/gcc-plugins/",
> the sub-directory name describes it very well.
> 
> 
> > Plugins take part in the image building process
> > in a different way than these tools and scripts do.
> > Since there doesn't seen to be a good place for compiler plugins, maybe we should create a new toplevel directory
> > called "build". Compiler plugins and other existing build tools could live there. What do you think?
> 
> In my understanding, they are plug-in'ed into the cross-compiler that
> compiles vmlinux.
> 
> If so, GCC plugins should be happy in "scripts/"
> because Kbuild descends into "scripts/" before building any objects for vmlinux.

Ok, I'll move them under scripts/ in the next patch set.

-- 
Emese
