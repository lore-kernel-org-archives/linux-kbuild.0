Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.190]:47631 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757517AbYBYWcr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Feb 2008 17:32:47 -0500
Received: by nf-out-0910.google.com with SMTP id g13so931822nfb.21
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Feb 2008 14:32:45 -0800 (PST)
Message-ID: <8499950a0802251432q1e59e542nfa06f66becef63aa@mail.gmail.com>
Date: Mon, 25 Feb 2008 23:32:44 +0100
From: "Oleg Verych" <olecom@gmail.com>
Subject: Re: [PATCH] Compress kernel modules on installation.
In-Reply-To: <20080225221953.GX8953@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080225214209.a3f79327.sbrokenshire@xestia.co.uk>
	 <8499950a0802251417l7a2fff25q7fa57fce57369b1b@mail.gmail.com>
	 <20080225221953.GX8953@1wt.eu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Steve Brokenshire <sbrokenshire@xestia.co.uk>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Mon, Feb 25, 2008 at 11:19 PM, Willy Tarreau:
>
> On Mon, Feb 25, 2008 at 11:17:23PM +0100, Oleg Verych wrote:
>  > On Mon, Feb 25, 2008 at 10:42 PM, Steve Brokenshire:
>  > > Hi,
>  > >
>  > >  (I've sent this to the linux-kbuild and linux-kernel lists as this
>  > >  patch modifies the Makefile.modinst file. I also don't subscribe to the
>  > >  linux-kbuild and linux-kernel mailing lists so can I have any replies
>  > >  CC'ed to me please)
>  >
>  > And what if i like bzip2 (yea sometimes better) or 7zip (better if !EMBEDDED)
>  > or whatever?
>  >
>  > It's pure user/distro question.
>
>  not exactly, as only gzip is supported by module-init-tools. However,
>  if you come up with a patch to implement lzma or equivalent for
>  module-init-tools, it may be useful.

Oh, come on! It's userspace, i have scripts managing existence/compression
on per-file basis on my comp. If most distros just drop thousands of useless
(sometimes compressed) stuff to your harddisk, it's not kernel's or
modules-init-tools'
problem.

Also having compressed over compressed stuff, like on initramfs booting image
with such modules (if by defaults) may cause bigger file, more CPU overhead.

It is userspace and all that policy stuff, etc., etc.

Want to make a minidistro on lkml? Well, i see klibc working fine already.
_______
