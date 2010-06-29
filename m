Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out1.smtp.messagingengine.com ([66.111.4.25]:53605 "EHLO
	out1.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753912Ab0F2NgH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 29 Jun 2010 09:36:07 -0400
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 3520C1094B6
	for <linux-kbuild@vger.kernel.org>; Tue, 29 Jun 2010 09:36:04 -0400 (EDT)
Received: from [192.168.1.15] (ppp118-209-216-2.lns20.mel6.internode.on.net [118.209.216.2])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 9C6084EED22
	for <linux-kbuild@vger.kernel.org>; Tue, 29 Jun 2010 09:35:59 -0400 (EDT)
Message-ID: <4C29F6B1.3060205@fastmail.com.au>
Date: Tue, 29 Jun 2010 23:35:45 +1000
From: Allan Duncan <amd2345@fastmail.com.au>
MIME-Version: 1.0
Subject: "make gconfig" fails to compile
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

The last couple of kernels I've built (2.6.33.5 and 2.6.34) barfed on 
gconfig.
I think it is due to an update of fedora's libraries, anyway the file
scripts/kconfig/Makefile line 201:
HOSTLOADLIBES_gconf     = `pkg-config --libs gtk+-2.0 gmodule-2.0 
libglade-2.0`
needs " -ldl" added to the end, like qconf a few lines above has.
