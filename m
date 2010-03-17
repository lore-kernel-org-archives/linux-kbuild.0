Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 63.mail-out.ovh.net ([91.121.185.56]:58554 "HELO
	63.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752747Ab0CQRtd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Mar 2010 13:49:33 -0400
Message-ID: <4BA11627.6020308@example.com>
Date: Wed, 17 Mar 2010 18:49:27 +0100
From: Piotr Hosowicz <piotr@hosowicz.com>
Reply-To: piotr@hosowicz.com
MIME-Version: 1.0
Subject: Re: Maybe my frequent kernel building could be of some help to the
 community? And how to build?
References: <4B9FD5D1.8040203@example.com> <4B9FDAF3.9010804@xenotime.net> <4BA04B59.6090804@example.com> <4BA0F031.2070104@xenotime.net> <4BA0F8DE.1050006@example.com> <4BA0FB35.8090207@xenotime.net>
In-Reply-To: <4BA0FB35.8090207@xenotime.net>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org

Randy Dunlap wrote:

> The first thing that I would try is enabling CONFIG_DEVTMPFS and
> CONFIG_DEVTMPFS_MOUNT, rebuild, reboot...

I've rebuilt and it boots fine. Just after booting the kernel it had to 
think for a while and I was afraid that it won't boot at all. But it booted.

BTW What is this message during building about? Should I worry?

WARNING: modpost: Found 106 section mismatch(es).
To see full details build your kernel with:
'make CONFIG_DEBUG_SECTION_MISMATCH=y'

Regards,

Piotr Hosowicz

-- 
"[Oleksy] dotkn±³ naszych domów, naszych ¿on, naszych dzieci,
naszych psów, naszych ¦WINEK MORSKICH, on po prostu wkroczy³
swoim g³upim gadaniem w sferê prywatn±, która musi byæ chro-
niona dla dobra ka¿dego z nas" - powiedzia³ Kwa¶niewski.
NP:  -

