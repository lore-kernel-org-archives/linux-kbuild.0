Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:59923 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752560Ab1AZIqF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 26 Jan 2011 03:46:05 -0500
Received: by eye27 with SMTP id 27so347290eye.19
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Jan 2011 00:46:03 -0800 (PST)
Message-ID: <4D3FDF48.5070402@gmail.com>
Date: Wed, 26 Jan 2011 11:46:00 +0300
From: Nikolai Kondrashov <spbnick@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] deb-pkg: Fix building outside of source tree (O=...).
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?ISO-8859-1?Q?Nicolas_de_Peslo=C3=BCan?= <nicolas.2p.debian@free.fr>
Cc: linux-kbuild@vger.kernel.org

> When building linux-headers package using deb-pkg, builddeb erroneously
> assume current directory is the source tree. This is not true if building
> in another directory, using make O=... deb-pkg.
>
> This patch fix this problem.
Thanks, Nicolas, it works!

This problem was holding me from testing my patches and I didn't have enough
time to find the fix myself.

FWIW,
Tested-by: Nikolai Kondrashov <spbnick@gmail.com>

Sincerely,
Nick
