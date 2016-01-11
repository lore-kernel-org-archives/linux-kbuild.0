Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:51399 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758693AbcAKJXs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Jan 2016 04:23:48 -0500
Subject: =?UTF-8?Q?Re:_Kernel_build_fails_=22cannot_move_=e2=80=98arch/arm/b?=
 =?UTF-8?Q?oot/compressed/.piggy.gzip.o.tmp=22_then_succeeds?=
References: <20160111082603.GA24950@amd> <20160111085831.GA7012@amd>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <569374A2.5050602@suse.cz>
Date: Mon, 11 Jan 2016 10:23:46 +0100
MIME-Version: 1.0
In-Reply-To: <20160111085831.GA7012@amd>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-kbuild@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>

On 2016-01-11 09:58, Pavel Machek wrote:
> Second try:
> 
>   AS      arch/arm/boot/compressed/piggy.gzip.o
>   AS      arch/arm/boot/compressed/piggy.gzip.o
> mv: cannot move ‘arch/arm/boot/compressed/.piggy.gzip.o.tmp’ to ‘arch/arm/boot/compressed/.piggy.gzip.o.cmd’: No such file or directory

I guess you are missing 3939f3345050 ("ARM: 8418/1: add boot image
dependencies to not generate invalid images"). Without this fix and with
'make uImage zImage', two make instances try to produce a zImage at the
same time.

Michal
