Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fgwmail6.fujitsu.co.jp ([192.51.44.36]:43721 "EHLO
	fgwmail6.fujitsu.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750955AbYIDEXZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 4 Sep 2008 00:23:25 -0400
Date: Thu, 04 Sep 2008 13:22:55 +0900
From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Subject: Re: [PATCH] ncurses based config
In-Reply-To: <1220469076-16487-1-git-send-email-nir@tzachar.com>
References: <1220469076-16487-1-git-send-email-nir@tzachar.com>
Message-Id: <20080904132008.DB14.KOSAKI.MOTOHIRO@jp.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nir Tzachar <tzachar@grad120a.cs.bgu.ac.il>
Cc: kosaki.motohiro@jp.fujitsu.com, linux-kernel@vger.kernel.org, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, Nir Tzachar <nir@tzachar.com>

Hi

> This patch was inspired by the kernel projects page, where an ncurses
> replacement for menuconfig was mentioned (by Sam Ravnborg).
> 
> Building on menuconfig, this patch implements a more modern look interface using
> ncurses and ncurses' satellite libraries (menu, panel, form). The implementation
> does not depend on lxdialog, which is currently distributed with the kernel.
> 
> The only change outside of nconf.c is due to a name clash: both ncurses and
> lkc.h define a fucntion named menu_init(). I changed the internal version's
> name. 
> 
> Please consider the patch for merging. Comments are appreciated.

if I run "make nconfig" on GNU screen, I can't see cursor position.
is this intensional?



