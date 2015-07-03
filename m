Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb3-smtp-cloud3.xs4all.net ([194.109.24.30]:33789 "EHLO
	lb3-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755053AbbGCJSa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Jul 2015 05:18:30 -0400
Message-ID: <1435915103.2423.53.camel@tiscali.nl>
Subject: Re: [PATCH 0/2] kconfig: allow use of relations other than
 (in)equality
From: Paul Bolle <pebolle@tiscali.nl>
Date: Fri, 03 Jul 2015 11:18:23 +0200
In-Reply-To: <559599C2.6090505@suse.cz>
References: <557EDA310200007800084C43@mail.emea.novell.com>
	 <6743206.QpmKW5snMP@tacticalops> <559599C2.6090505@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Martin Walch <walch.martin@web.de>
Cc: Michal Marek <mmarek@suse.cz>, Jan Beulich <JBeulich@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On do, 2015-07-02 at 22:06 +0200, Michal Marek wrote:
> The patch just adds four new binary operations of the same order as 
> the
> existing == and !=, with a the semantics that everybody expects. And 
> the
> grammar for kconfig expressions is so simplistic that you cannot even
> write things like (A && B) == (C && D). So turing completeness is not 
> a
> topic here, neither before nor after this patch.

So, if you're worried by the complexity added by allowing these
operations, you might considering keeping an eye out for patches that
use them. Because, obviously, the review of those patches could also be
used to demonstrate their downsides. Actually, since
DEBUG_UART_8250_WORD already uses ">=", and that's now become legal,
perhaps the downsides can already be demonstrated.

Thanks,


Paul Bolle
