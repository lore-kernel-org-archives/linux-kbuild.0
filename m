Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34858 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbgBQPa2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Feb 2020 10:30:28 -0500
Received: by mail-wm1-f66.google.com with SMTP id b17so18930744wmb.0
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Feb 2020 07:30:27 -0800 (PST)
Date: Mon, 17 Feb 2020 15:30:23 +0000
From: Quentin Perret <qperret@google.com>
Subject: Re: [PATCH v4 1/3] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
Message-ID: <20200217153023.GA71210@google.com>
References: <20200212202140.138092-1-qperret@google.com>
 <20200212202140.138092-2-qperret@google.com>
 <20200217152201.GA48466@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200217152201.GA48466@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Maennich <maennich@google.com>
Cc: masahiroy@kernel.org, nico@fluxnic.net, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, kernel-team@android.com, jeyu@kernel.org, hch@infradead.org

On Monday 17 Feb 2020 at 15:22:01 (+0000), Matthias Maennich wrote:
> In case the whitelist file can't be found, the error message is
> 
>  cat: path/to/file: file not found
> 
> I wonder whether we can make this error message a bit more specific by
> telling the user that the KSYMS_WHITELIST is missing.

+1, that'd be really useful. I'll check the file existence in v5 (in a
POSIX-compliant way, I promise).

> With the above addressed (and your amend for the absolute path test),
> please feel free to add
> 
> Tested-by: Matthias Maennich <maennich@google.com>
> Reviewed-by: Matthias Maennich <maennich@google.com>

Thanks!
Quentin
