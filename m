Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:60466 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751260AbbGBNEl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Jul 2015 09:04:41 -0400
From: Martin Walch <walch.martin@web.de>
Subject: Re: [PATCH 0/2] kconfig: allow use of relations other than (in)equality
Date: Thu, 02 Jul 2015 15:04:27 +0200
Message-ID: <6743206.QpmKW5snMP@tacticalops>
In-Reply-To: <557EDA310200007800084C43@mail.emea.novell.com>
References: <557EDA310200007800084C43@mail.emea.novell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Michal Marek <mmarek@suse.cz>, pebolle@tiscali.nl, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

> 1: allow use of relations other than (in)equality

I know it is a bit late for objections. Still, I want to point out that
this looks to me like a major extension to the language.

Kconfig is a configuration language, and as far as I can tell it is
(intentionally) not Turing complete to keep the configuration simple and
controllable. All relations that have been defined so far check for equality
(or for being not equal). The new relations "<=", ">=", "<", and ">" add more
expressiveness, potentially making the language actually more complex and
reasoning harder.

Once the new relations are added, it will be hard to get rid of them again.
So, should this patch be reconsidered?

Regards,
Martin Walch
-- 

