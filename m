Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:32856 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754732AbYFHU67 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Jun 2008 16:58:59 -0400
Subject: Re: [PATCH] Speed up "make headers_*"
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20080608200727.GA32141@uranus.ravnborg.org>
References: <20080608094730.GA30098@uranus.ravnborg.org>
	 <20080608200727.GA32141@uranus.ravnborg.org>
Content-Type: text/plain
Date: Sun, 08 Jun 2008 21:58:54 +0100
Message-Id: <1212958734.2534.51.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Mike Frysinger <vapier@gentoo.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>

It doesn't look like headers_check_all will work after your patches --
but to be fair I don't think it worked _before_ them either. When you
run headers_install_all, there's no asm/ directory -- and thus the check
will fail for any headers in linux/ which try to include <asm/*.h>. 

Did this _ever_ work?

-- 
dwmw2

