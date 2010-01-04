Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aeryn.fluff.org.uk ([87.194.8.8]:40996 "EHLO
	kira.home.fluff.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751694Ab0ADE6B (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 3 Jan 2010 23:58:01 -0500
Date: Mon, 4 Jan 2010 04:57:56 +0000
From: Ben Dooks <ben@fluff.org>
Subject: modules.order and modules.builting files created
Message-ID: <20100104045756.GA13621@fluff.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

The modules.order and modules.builtin files are ending up clogging
up 'git status' enquiries after building a recent kernel. Is there
any reason these can't be hidden?

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
