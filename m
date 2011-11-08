Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:34970 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754874Ab1KHXml (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Nov 2011 18:42:41 -0500
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] module: Fix performance regression on modules with large symbol tables
In-Reply-To: <4EB8EE31020000780005F869@novprvoes0310.provo.novell.com>
References: <467be983bed865e1b772136ed488f9ff@localhost> <874nygu3cd.fsf@rustcorp.com.au> <CAJiQ=7D4SSzzkPpPMGnaTq-wZXUGmXCRfKhYdPFg7APDu+VTwA@mail.gmail.com> <4EB8EE31020000780005F869@novprvoes0310.provo.novell.com>
Date: Wed, 09 Nov 2011 08:00:27 +1030
Message-ID: <87sjlyqp3g.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>, Kevin Cernekee <cernekee@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 08 Nov 2011 00:54:09 -0700, "Jan Beulich" <JBeulich@suse.com> wrote:
> >>> On 07.11.11 at 20:58, Kevin Cernekee <cernekee@gmail.com> wrote:
> > We will also want to check the strmap bits, since it's possible that
> > "cba_" was a core symbol but "edcba_" is not.  In which case we did not
> > allocate room for the "ed" part, back in layout_symtab().
> 
> Why would you want to keep the leading part if it's not part of a
> core symbol's name?

Indeed, sorry, I didn't read this part.

Cheers,
Rusty.
