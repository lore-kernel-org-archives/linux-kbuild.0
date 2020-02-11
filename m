Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51389 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727045AbgBKFls (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Feb 2020 00:41:48 -0500
Received: by mail-wm1-f68.google.com with SMTP id t23so1867990wmi.1
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Feb 2020 21:41:47 -0800 (PST)
Date: Tue, 11 Feb 2020 05:41:42 +0000
From: Quentin Perret <qperret@google.com>
Subject: Re: [PATCH v3 1/3] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
Message-ID: <20200211054142.GA72419@google.com>
References: <20200207180755.100561-1-qperret@google.com>
 <20200207180755.100561-2-qperret@google.com>
 <nycvar.YSQ.7.76.2002071319200.1559@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YSQ.7.76.2002071319200.1559@knanqh.ubzr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: masahiroy@kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, maennich@google.com, kernel-team@android.com, jeyu@kernel.org, hch@infradead.org

On Friday 07 Feb 2020 at 13:22:12 (-0500), Nicolas Pitre wrote:
> This "[[ ]]" is a bashism. I think there was an effort not to depend on 
> bash for the build system.

OK, I see.

> So either this needs to be changed to basic 
> bourne shell, or the interpretor has to be /bin/bash not /bin/sh.

So, as per the above, the basic bourne shell option sounds preferable,
I'll go fix this for v4.

Thanks,
Quentin
