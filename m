Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.177]:60651 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751978AbZHLMhb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 12 Aug 2009 08:37:31 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH] kbuild: Do not select symbols with unmet dependencies
Date: Wed, 12 Aug 2009 14:36:58 +0200
References: <20090812112308.30683.24700.stgit@pc1117.cambridge.arm.com>
In-Reply-To: <20090812112308.30683.24700.stgit@pc1117.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <200908121436.58490.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

On Wednesday 12 August 2009, Catalin Marinas wrote:
> The "select" statement in Kconfig files allows the enabling of options
> even if they have unmet direct dependencies (i.e. "depends on" expands
> to "no"). Currently, the "depends on" clauses are used in calculating
> the visibility but they do not affect the reverse dependencies in any
> way.
> 
> The patch introduces additional tracking of the "depends on" statements
> and does not allow selecting an option if its direct dependencies are
> not met, also printing a warning.
> 
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

I guess this will change the behaviour of a number of subsystems,
likely causing unexpected regressions. I think your change
makes sense, but we need to be much more careful.

Can you extract a list of configuration symbols that are
impacted by your patch? A possibly way out could be to annotate
all of them first by changing

---
config FOO
	bool

config BAR
	depends on FOO

config BAZ
	select BAR
---

so that we either get

config BAZ
	select FOO
	select BAR

or alternatively, on a case-by-case basis

config BAZ
	depends on FOO
	select BAR

Once that is in place, all the symbols have a well-defined behaviour
and we can safely apply your patch.

	Arnd <><
