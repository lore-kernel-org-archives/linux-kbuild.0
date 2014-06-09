Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:32777 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750756AbaFIFEQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Jun 2014 01:04:16 -0400
Date: Mon, 09 Jun 2014 14:04:12 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [Question] Why CONFIG_SHELL
Message-Id: <20140609140411.95B6.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

Hi experts.

I think all the macros with CONFIG_ prefix are supposed to be
defined in Kconfig.
But I've been long wondering why there exists one exception:
CONFIG_SHELL.

Is there any historical, or special reason?

Is it good to rename it to KBUILD_SHELL or something else?


Best Regards
Masahiro Yamada

