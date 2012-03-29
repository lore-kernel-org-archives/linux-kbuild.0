Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:36883 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751323Ab2C2FNN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Mar 2012 01:13:13 -0400
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] modpost: Fix modpost's license checking V3
In-Reply-To: <4F711EC0.3080708@am.sony.com>
References: <CACqU3MUXAOMGQ1nzUrtYPEQAC3U-nuq3YurtNJJLS1hft4ROGA@mail.gmail.com> <1310626276-4541-1-git-send-email-abogani@kernel.org> <4F6D2BC5.9070200@am.sony.com> <4F711EC0.3080708@am.sony.com>
Date: Thu, 29 Mar 2012 15:07:32 +1030
Message-ID: <87hax8yqcz.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frank Rowand <frank.rowand@am.sony.com>, Alessio Igor Bogani <abogani@kernel.org>
Cc: Jan Beulich <jbeulich@novell.com>, Kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "Bird, Tim" <Tim.Bird@am.sony.com>, Anders Kaseorg <andersk@ksplice.com>, Arnaud Lacombe <lacombar@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>

On Mon, 26 Mar 2012 18:58:24 -0700, Frank Rowand <frank.rowand@am.sony.com> wrote:
> The attached patch modifies your patch to also use export_from_secname()
> for vmlinux and vmlinux.o.

OK, today is my last day online for six weeks, so Alessio, please come
up with a fix and push straight to Linus once consensus is reached.

If that's impossible, I'll review when I get back.

Thanks,
Rusty.
-- 
  How could I marry someone with more hair than me?  http://baldalex.org
