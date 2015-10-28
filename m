Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yk0-f172.google.com ([209.85.160.172]:36546 "EHLO
	mail-yk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932392AbbJ1HH0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2015 03:07:26 -0400
Received: by ykba4 with SMTP id a4so237802973ykb.3
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Oct 2015 00:07:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20151028070045.GI1854@malice.jf.intel.com>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
	<1445992931-28107-8-git-send-email-olof@lixom.net>
	<20151028070045.GI1854@malice.jf.intel.com>
Date: Wed, 28 Oct 2015 16:07:25 +0900
Message-ID: <CAOesGMgdX4TXwN7psHCHVoJ=BGnZQUp_0UWTK6n-tH3wUcWykw@mail.gmail.com>
Subject: Re: [PATCH 07/10] merge_config.sh: add tests
From: Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Michal Marek <mmarek@suse.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@linux.intel.com>

On Wed, Oct 28, 2015 at 4:00 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Wed, Oct 28, 2015 at 09:42:08AM +0900, Olof Johansson wrote:
>> For being a small script, merge_config.sh is fairly scary to change since there's no
>> real way to know if you did something wrong. So it seems appropriate to add a simple
>> test suite.
>>
>> I've started with testcases in the areas I care about, other should of course feel
>> free to expand on this.
>>
>> Use is simple, from the kernel tree, run ./scripts/kconfig/merge_config_test/runall.
>> It'll execute out of a tmpdir under /tmp.
>>
>> Signed-off-by: Olof Johansson <olof@lixom.net>
>
> Thanks for writing the test cases. Shell scripting is so easy to bikeshed - so
> I'm going to skip that. I didn't catch any bashisms, and the test coverage is
> good.

Thanks!

Anyone who wishes to contribute style comments has to contribute at
least one additional testcase as well. Fair? :)


-Olof
