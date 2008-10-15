Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from enyo.dsw2k3.info ([195.71.86.239]:33518 "EHLO enyo.dsw2k3.info"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751467AbYJOLfI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Oct 2008 07:35:08 -0400
Received: from localhost (localhost [127.0.0.1])
	by enyo.dsw2k3.info (Postfix) with ESMTP id 769C92BDAF
	for <linux-kbuild@vger.kernel.org>; Wed, 15 Oct 2008 13:09:34 +0200 (CEST)
Received: from enyo.dsw2k3.info ([127.0.0.1])
	by localhost (enyo.dsw2k3.info [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IL0w6ZM5kdz0 for <linux-kbuild@vger.kernel.org>;
	Wed, 15 Oct 2008 13:09:25 +0200 (CEST)
Received: from citd.de (p4FC4FFF4.dip.t-dialin.net [79.196.255.244])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(Client did not present a certificate)
	by enyo.dsw2k3.info (Postfix) with ESMTP id 915802BC5A
	for <linux-kbuild@vger.kernel.org>; Wed, 15 Oct 2008 13:09:24 +0200 (CEST)
Date: Wed, 15 Oct 2008 13:09:21 +0200
From: Matthias Schniedermeyer <ms@citd.de>
Subject: Is there a GOOD reason why the autodetected ARCH is still
	ARCH=i386 or ARCH=x86_64 and not ARCH=x86
Message-ID: <20081015110921.GA14133@citd.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi



I have several x86-32bit system and compile them on a x86-64bit system. 

Whenever i forget to supply "ARCH=x86" for *config/build/whatever this 
messes with the build or totaly botches the .config (for *config)

Why isn't i386 and x86_64 just treated as "x86"?

Or at least don't overrwrite THE first 4 CONFIGs:
CONFIG_64BIT
CONFIG_X86_32
CONFIG_X86_64
CONFIG_X86
for an existing .config.




Bis denn

-- 
Real Programmers consider "what you see is what you get" to be just as 
bad a concept in Text Editors as it is in women. No, the Real Programmer
wants a "you asked for it, you got it" text editor -- complicated, 
cryptic, powerful, unforgiving, dangerous.

