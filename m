Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37708 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728969AbgBQQfn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Feb 2020 11:35:43 -0500
Received: by mail-wr1-f66.google.com with SMTP id w15so20525164wru.4
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Feb 2020 08:35:42 -0800 (PST)
Date: Mon, 17 Feb 2020 16:35:40 +0000
From: Matthias Maennich <maennich@google.com>
Subject: Re: [PATCH v4 1/3] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
Message-ID: <20200217163540.GD48466@google.com>
References: <20200212202140.138092-1-qperret@google.com>
 <20200212202140.138092-2-qperret@google.com>
 <20200217152201.GA48466@google.com>
 <20200217153023.GA71210@google.com>
 <nycvar.YSQ.7.76.2002171059230.1559@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <nycvar.YSQ.7.76.2002171059230.1559@knanqh.ubzr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Quentin Perret <qperret@google.com>, masahiroy@kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, kernel-team@android.com, jeyu@kernel.org, hch@infradead.org

On Mon, Feb 17, 2020 at 11:00:39AM -0500, Nicolas Pitre wrote:
>On Mon, 17 Feb 2020, Quentin Perret wrote:
>
>> On Monday 17 Feb 2020 at 15:22:01 (+0000), Matthias Maennich wrote:
>> > In case the whitelist file can't be found, the error message is
>> >
>> >  cat: path/to/file: file not found
>> >
>> > I wonder whether we can make this error message a bit more specific by
>> > telling the user that the KSYMS_WHITELIST is missing.
>>
>> +1, that'd be really useful. I'll check the file existence in v5 (in a
>> POSIX-compliant way, I promise).
>
>In fact, if you explicitly provide a file that is not there, then this
>is arguably a good reason to even fail the build.

I agree, I would expect the build to fail in that case.

Cheers,
Matthias

>
>
>Nicolas
