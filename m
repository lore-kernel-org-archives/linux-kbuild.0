Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oa0-f50.google.com ([209.85.219.50]:57877 "EHLO
	mail-oa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755738AbaFKQYc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Jun 2014 12:24:32 -0400
MIME-Version: 1.0
In-Reply-To: <cover.1402503408.git.luto@amacapital.net>
References: <5398749B.4090209@zytor.com>
	<cover.1402503408.git.luto@amacapital.net>
Date: Wed, 11 Jun 2014 12:24:31 -0400
Message-ID: <CA+5PVA5Yxq83or2usv-Wog-6AMf91c_bFvCHYc=H=L-k_oXfxA@mail.gmail.com>
Subject: Re: [PATCH 0/2] x86,vdso,kbuild: Fix vdso_install
From: Josh Boyer <jwboyer@fedoraproject.org>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>

On Wed, Jun 11, 2014 at 12:20 PM, Andy Lutomirski <luto@amacapital.net> wrote:
> This changes kbuild slightly because I didn't want to fight with using
> static pattern rules and extra obfuscated fake targets just to write a
> loop.
>
> Better ideas / cleanups welcome.
>
> Andy Lutomirski (2):
>   kbuild: Add recipe-cmd, an @-less cmd variant
>   x86,vdso: Fix vdso_install

You won the race :).  I'll give these a spin shortly.

josh
