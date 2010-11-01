Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:45665 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752281Ab0KARle convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Nov 2010 13:41:34 -0400
Received: by ywc21 with SMTP id 21so994898ywc.19
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Nov 2010 10:41:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4CCEEB74.9010809@oracle.com>
References: <3B997B64E0C94A689C4C5FDBD09AF912@PC200810081817>
	<20101029100707.2a9afc5c.randy.dunlap@oracle.com>
	<942B93F2162249F3B4CE745DAF6FD9E1@PC200810081817>
	<4CCEEB74.9010809@oracle.com>
Date: Mon, 1 Nov 2010 13:41:33 -0400
Message-ID: <AANLkTikTLGett2Tinn9+x6Srd5Hre9zKHLb+g8+KJCym@mail.gmail.com>
Subject: Re: config help
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Yihe Chen <yihect@juliantec.info>, linux kbuild list <linux-kbuild@vger.kernel.org>

Hi,

On Mon, Nov 1, 2010 at 12:31 PM, Randy Dunlap <randy.dunlap@oracle.com> wrote:
> Anyway, in 2.6.35, scripts/kconfig/Makefile is fairly clear on those
> short option strings:
>
> -o      oldconfig
> -s      silentoldconfig
> -r      randconfig
> -y      allyesconfig
> -n      allnoconfig
> -m      allmodconfig
> -d      defconfig
> -D filename     use filename as default configuration
>
This is no longer the case for 2.6.36. That part of `conf' has been
moved to long options. It points to the toplev README for more info
(which are not preset), but I don't think these low level options
description belong there.

I've got some patches in the area, that should not be long.

- Arnaud
