Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pb-smtp1.pobox.com ([64.147.108.70]:55575 "EHLO
        pb-smtp1.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727277AbgBQQAn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Feb 2020 11:00:43 -0500
Date: Mon, 17 Feb 2020 11:00:39 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH v4 1/3] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
In-Reply-To: <20200217153023.GA71210@google.com>
Message-ID: <nycvar.YSQ.7.76.2002171059230.1559@knanqh.ubzr>
References: <20200212202140.138092-1-qperret@google.com> <20200212202140.138092-2-qperret@google.com> <20200217152201.GA48466@google.com> <20200217153023.GA71210@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: Matthias Maennich <maennich@google.com>, masahiroy@kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, kernel-team@android.com, jeyu@kernel.org, hch@infradead.org

On Mon, 17 Feb 2020, Quentin Perret wrote:

> On Monday 17 Feb 2020 at 15:22:01 (+0000), Matthias Maennich wrote:
> > In case the whitelist file can't be found, the error message is
> > 
> >  cat: path/to/file: file not found
> > 
> > I wonder whether we can make this error message a bit more specific by
> > telling the user that the KSYMS_WHITELIST is missing.
> 
> +1, that'd be really useful. I'll check the file existence in v5 (in a
> POSIX-compliant way, I promise).

In fact, if you explicitly provide a file that is not there, then this 
is arguably a good reason to even fail the build.


Nicolas
