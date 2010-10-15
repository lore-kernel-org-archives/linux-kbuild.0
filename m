Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:51238 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753667Ab0JPS5x (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 16 Oct 2010 14:57:53 -0400
Received: by bwz15 with SMTP id 15so1911337bwz.19
        for <linux-kbuild@vger.kernel.org>; Sat, 16 Oct 2010 11:57:36 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 15 Oct 2010 13:54:51 +0300
Message-ID: <AANLkTinjZOS+n6RfdshXdOk7uN4neEKPitT12srK1GsF@mail.gmail.com>
Subject: kconfig issue with 'choice' and defconfigs
From: Felipe Contreras <felipe.contreras@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

Hi,

I noticed this when playing with USB (USB_GADGET_MUSB_HDRC), basically
anything 'choice' related doesn't play nice with defconfigs.

Any ideas?

./scripts/kconfig/conf --defconfig=/dev/null testconfig

testconfig:
---
config FRIEND
	bool
	select MARK
	default y

choice
	prompt "pick one"

config NOONE
	bool "no one"

config JOHN
	bool "john"

config JOHNJR
	tristate
	depends on JOHN
	default FRIEND

config MARK
	bool "mark"

endchoice
---

CONFIG_FRIEND=y
CONFIG_NOONE=y
# CONFIG_JOHN is not set
# CONFIG_MARK is not set

-- 
Felipe Contreras
