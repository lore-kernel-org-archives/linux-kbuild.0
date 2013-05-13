Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:34457 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753173Ab3EMC51 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 May 2013 22:57:27 -0400
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: Build failures due to commit ea4054a2384 (handle huge number of modules)
In-Reply-To: <20130509041448.GA11398@roeck-us.net>
References: <20130508213007.GA11946@roeck-us.net> <8761ytnf8f.fsf@rustcorp.com.au> <20130509041448.GA11398@roeck-us.net>
Date: Mon, 13 May 2013 11:52:09 +0930
Message-ID: <87ehdb39gu.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>

Guenter Roeck <linux@roeck-us.net> writes:
> Attached is a failing configuration for x86_64. Note that
> drivers/staging/android/logger.c fails to build with this configuration,
> so you have to build it with make -i to see the problem.
>
> Looking through my logs, it seems that the problem may be related to other
> build errors. At least in my latest nightly builds there was always some other
> build error when this happened.

That would explain it.  Perhaps some kind of race?

I can't see this as a real problem, though.

Cheers,
Rusty.
