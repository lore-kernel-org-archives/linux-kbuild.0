Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37107 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751265AbbJFCAB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 5 Oct 2015 22:00:01 -0400
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH v2] modpost: Add flag -E for making section mismatches fatal
In-Reply-To: <1443807963-36364-1-git-send-email-drinkcat@chromium.org>
References: <1443807963-36364-1-git-send-email-drinkcat@chromium.org>
Date: Tue, 06 Oct 2015 09:45:06 +1030
Message-ID: <87y4fgnc05.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Boichat <drinkcat@chromium.org>, linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, "Paul E . McKenney" <paulmck@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Pranith Kumar <bobby.prani@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Davidlohr Bueso <dave@stgolabs.net>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, John Stultz <john.stultz@linaro.org>, Jan Kiszka <jan.kiszka@siemens.com>, Quentin Casasnovas <quentin.casasnovas@oracle.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Chris Metcalf <cmetcalf@ezchip.com>, Takashi Iwai <tiwai@suse.de>, Kyle McMartin <kyle@redhat.com>, linux-kernel@vger.kernel.org, Jonathan Kliegman <kliegs@chromium.org>, olofj@chromium.org, Sam Ravnborg <sam@ravnborg.org>

Nicolas Boichat <drinkcat@chromium.org> writes:
> The section mismatch warning can be easy to miss during the kernel build
> process. Allow it to be marked as fatal to be easily caught and prevent
> bugs from slipping in.
>
> Setting CONFIG_SECTION_MISMATCH_WARN_ONLY=y causes these warnings to be
> non-fatal, since there are a number of section mismatches when using
> allmodconfig on some architectures, and we do not want to break these
> builds by default.
>
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
>
> Change-Id: Ic346706e3297c9f0d790e3552aa94e5cff9897a6

Thanks, applied.

Cheers,
Rusty.
