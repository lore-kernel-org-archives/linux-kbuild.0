Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:17422 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752616AbaHSNP2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Aug 2014 09:15:28 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: Re: Overriding -Werror
References: <20140814222119.GD18411@ld-irv-0074>
Date: Tue, 19 Aug 2014 06:15:07 -0700
In-Reply-To: <20140814222119.GD18411@ld-irv-0074> (Brian Norris's message of
	"Thu, 14 Aug 2014 15:21:19 -0700")
Message-ID: <87ppfwmxic.fsf@tassilo.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Artem Bityutskiy <dedekind1@gmail.com>

Brian Norris <computersforpeace@gmail.com> writes:
>
> 4. better ideas?

Just send patches to remove -Werror in all architectures
as a tree sweep (and anywhere else where someone misguided add it)

Having -Werror anywhere in a shipping release is just plainly a bug,
as it makes it often impossible to build on newer gcc versions.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only
