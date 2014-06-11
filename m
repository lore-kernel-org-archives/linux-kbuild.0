Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:49531 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932317AbaFKR2A (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Jun 2014 13:28:00 -0400
Message-ID: <53989190.9010806@zytor.com>
Date: Wed, 11 Jun 2014 10:27:44 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] x86,vdso: Fix vdso_install
References: <5398749B.4090209@zytor.com>	<cover.1402503408.git.luto@amacapital.net>	<fe51e9f5c338d33b1a8b20813441538df5e17add.1402503408.git.luto@amacapital.net> <CA+5PVA5uPj0JiTLXJAtBt9b9e6aEcJh7ApFRbaCAP0=se89GKA@mail.gmail.com>
In-Reply-To: <CA+5PVA5uPj0JiTLXJAtBt9b9e6aEcJh7ApFRbaCAP0=se89GKA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Boyer <jwboyer@fedoraproject.org>, Andy Lutomirski <luto@amacapital.net>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>

On 06/11/2014 10:23 AM, Josh Boyer wrote:
> 
> So this does fix the invocation of 'make vdso_install' and the
> resulting files look to be accurate to me, with the glaring exception
> that now we get e.g. vdso64.so on x86_64 as the installed file instead
> of vdso.so.  How much that actually matters, I have no idea.
> Plausibly fixed with a symlink if we really need to perhaps.
> 

You have that problem anyway, no?  After all, there are three different
vdso images for 32 bits, and you can run 32-bit apps on 64-bit systems, too.

Is there realistically any way for the debugger to pick up the correct one?

	-hpa


