Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:37908 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751576AbbINTGF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Sep 2015 15:06:05 -0400
Received: by wiclk2 with SMTP id lk2so145457261wic.1
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2015 12:06:03 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
Subject: [PATCH 0/1] [RFC] kconfig: menuconfig make "Selected by:" readable
Date: Mon, 14 Sep 2015 21:05:42 +0200
Message-Id: <1442257543-6194-1-git-send-email-petr.vorel@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Petr Vorel <petr.vorel@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Randy Dunlap <rdunlap@infradead.org>

Hi there,

I like Paul's patch, which he posted some time ago. I've been using it for a
while. How about including it?

Kind regards,
Petr

Paul Bolle (1):
  [RFC] kconfig: menuconfig make "Selected by:" readable

 scripts/kconfig/menu.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 81 insertions(+), 2 deletions(-)

-- 
1.8.0

