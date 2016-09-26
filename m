Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f171.google.com ([209.85.220.171]:34338 "EHLO
        mail-qk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1034686AbcIZSoF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Sep 2016 14:44:05 -0400
Received: by mail-qk0-f171.google.com with SMTP id n185so175703277qke.1
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Sep 2016 11:44:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1474912582.git.shuahkh@osg.samsung.com>
References: <cover.1474912582.git.shuahkh@osg.samsung.com>
From: Kees Cook <keescook@chromium.org>
Date: Mon, 26 Sep 2016 11:44:03 -0700
Message-ID: <CAGXu5j+eYRB+Kdyr0g6UG8_GFJz4dJ+VNsGVvnRtShn1pRT58g@mail.gmail.com>
Subject: Re: [PATCH 0/2] Moving runnable code from Documentation (last 2 patches)
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Michal Marek <mmarek@suse.com>, Andrew Morton <akpm@linux-foundation.org>, Dan Williams <dan.j.williams@intel.com>, Ingo Molnar <mingo@kernel.org>, Paul McKenney <paulmck@linux.vnet.ibm.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Tejun Heo <tj@kernel.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Nikolay Aleksandrov <nikolay@cumulusnetworks.com>, Dmitry Vyukov <dvyukov@google.com>, Steven Rostedt <rostedt@goodmis.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Hans Verkuil <hans.verkuil@cisco.com>, "Nicholas A. Bellinger" <nab@linux-iscsi.org>, mchehab@kernel.org, Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, ecree@solarflare.com, "David S. Miller" <davem@davemloft.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, linux-spi@vger.kernel.org

On Mon, Sep 26, 2016 at 11:40 AM, Shuah Khan <shuahkh@osg.samsung.com> wrote:
> This patch series contains the last 2 patches to complete moving runnable
> code from Documentation to selftests, samples, and tools.
>
> The first patch moves blackfin gptimers-example to samples and removes
> CONFIG_BUILD_DOCSRC.
>
> The second one updates 00-INDEX files under Documentation to reflect the
> move of runnable code from Documentation.

Looks good to me!

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
Nexus Security
