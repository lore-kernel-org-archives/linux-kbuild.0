Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:45143 "EHLO mail.skyhub.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752016AbcG2KTl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Jul 2016 06:19:41 -0400
Date: Fri, 29 Jul 2016 12:19:32 +0200
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] Kbuild: Move -Wmaybe-uninitialized to W=1
Message-ID: <20160729101932.GA27543@nazgul.tnic>
References: <20140616132045.GE8170@pd.tnic>
 <CA+55aFznBSQC+_KFq39eT2yTOd_cidqQ5viBLG6mshb_U_Y2EA@mail.gmail.com>
 <CA+55aFxT4Wvg_yeKbiksoe5btDW59oW1SHK=JaBAJ-L3YGWxQQ@mail.gmail.com>
 <19202646.LtBeEUK5Qq@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <19202646.LtBeEUK5Qq@wuerfel>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Michal Marek <mmarek@suse.com>, Sam Ravnborg <sam@ravnborg.org>, lkml <linux-kernel@vger.kernel.org>, Michael Matz <matz@suse.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, x86-ml <x86@kernel.org>

On Fri, Jul 29, 2016 at 12:08:51PM +0200, Arnd Bergmann wrote:
> Let me try to get to the bottom of this, maybe we can get the warning
> back in the future. It has found a number of actual bugs. The majority
> of -Wmaybe-uninitialized warnings that I fixed in linux-next were
> false positives (maybe four out of five) but I would think the reason

So this is exactly the problem: we should not fix perfectly fine code
just so that gcc remains quiet. So when you say "fixed false positives"
you actually mean, "changed it so that gcc -Wmaybe-u... doesn't fire"
right?

And we should not do that.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
