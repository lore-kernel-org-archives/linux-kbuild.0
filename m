Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pb-smtp2.pobox.com ([64.147.108.71]:63438 "EHLO
        pb-smtp2.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727358AbgBFQMP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Feb 2020 11:12:15 -0500
Date: Thu, 6 Feb 2020 11:12:12 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH v2] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
In-Reply-To: <20200206155651.GC16783@linux-8ccs>
Message-ID: <nycvar.YSQ.7.76.2002061103360.1559@knanqh.ubzr>
References: <20200129181541.105335-1-qperret@google.com> <20200206155651.GC16783@linux-8ccs>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jessica Yu <jeyu@kernel.org>
Cc: Quentin Perret <qperret@google.com>, masahiroy@kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, maennich@google.com, kernel-team@android.com

On Thu, 6 Feb 2020, Jessica Yu wrote:

> Hm, I thought TRIM_UNUSED_KSYMS just *unexports* unused symbols, no?
> "Trimmed from the build" sounds like the symbols are not compiled in
> or dropped completely. Please correct me if I misunderstood.

If they are unexposed, then it doesn't make much sense to keep them 
around wasting space. So yes, the compiler is free to optimize away the 
unused code at that point.

Please see the first part of the following article where effective 
kernel size reduction is is achieved with this feature:

https://lwn.net/Articles/746780/


Nicolas
