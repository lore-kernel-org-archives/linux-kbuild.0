Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 26.mail-out.ovh.net ([91.121.27.225]:39561 "HELO
	26.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751156Ab0C2UQe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Mar 2010 16:16:34 -0400
Message-ID: <4BB10A9D.7000506@example.com>
Date: Mon, 29 Mar 2010 22:16:29 +0200
From: Piotr Hosowicz <piotr@hosowicz.com>
Reply-To: piotr@hosowicz.com
MIME-Version: 1.0
Subject: Is root kernel parameter expected to be the first one or something?
References: <4B9FD5D1.8040203@example.com> <4B9FDAF3.9010804@xenotime.net>
In-Reply-To: <4B9FDAF3.9010804@xenotime.net>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org

Hello,

Today I had built a new next kernel with these parameters. I did not get 
what I expected

aapi205:/usr/src/linux# cat /proc/cmdline
vga=791 root=/dev/sda2 ro quiet

CONFIG_CMDLINE_BOOL=y
CONFIG_CMDLINE="vga=791"
# CONFIG_CMDLINE_OVERRIDE is not set

Is the order important for kernel parameters?

-- 
Familiada:
- Zwierze w paski?
- Biedronka!
NP: Patrick O'Hearn - Magnificent River
NB: 2.6.34-rc2-next-20100329+
