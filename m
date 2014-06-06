Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:56886 "EHLO
	asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751060AbaFFNQm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 6 Jun 2014 09:16:42 -0400
Date: Fri, 6 Jun 2014 15:16:16 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/2] kconfig: fix multi-byte UTF handling in nconfig
Message-ID: <20140606131616.GB4889@ravnborg.org>
References: <1401868351-24014-1-git-send-email-computersforpeace@gmail.com>
 <3051827.bgi1sztfBs@tacticalops>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3051827.bgi1sztfBs@tacticalops>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Martin Walch <walch.martin@web.de>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-kbuild@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>, Artem Bityutskiy <dedekind1@gmail.com>

> 
> Assumed that UTF-8 is the preferred character encoding, where should this
> apply? Only in help texts? Also in comments and in menu prompts?

UTF-8 should be supported in all display texts.
So help + prompts.

The Kconfig type "string" is not UTF-8 enabled.

Any help in audit Kconfig for this - and testing too - would be appreciated.

	Sam
