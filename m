Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:35883 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752817AbdC0Mn0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Mar 2017 08:43:26 -0400
MIME-Version: 1.0
In-Reply-To: <fabba6b8-8f8d-8f8f-1660-c579e6515563@suse.com>
References: <20170327054731.31882-1-sj38.park@gmail.com> <fabba6b8-8f8d-8f8f-1660-c579e6515563@suse.com>
From: SeongJae Park <sj38.park@gmail.com>
Date: Mon, 27 Mar 2017 21:42:48 +0900
Message-ID: <CAEjAshqR0Nhp4Wkmkg_HrswsiuUb3rYJ=TOUSBSvoUT3FSWTjg@mail.gmail.com>
Subject: Re: [PATCH 0/5] Fix dead URLs to ftp.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: rml@tech9.net, axboe@fb.com, shli@kernel.org, Ian Kent <raven@themaw.net>, yamada.masahito@socionext.com, linux-raid@vger.kernel.org, autofs@vger.kernel.org, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Mar 27, 2017 at 8:54 PM, Michal Marek <mmarek@suse.com> wrote:
> Dne 27.3.2017 v 07:47 SeongJae Park napsal(a):
>> URLs to `ftp.kernel.org` exist here and there though `ftp.kernel.org` is
>> already dead [0].  This patchset fixes those URLs to use `www.kernel.org`
>> instead.
>>
>> The change is splitted into multiple patches for independent review and merge
>> of each maintainer, though the change is trivial.
>>
>> [0] https://www.kernel.org/shutting-down-ftp-services.html
>>
>> SeongJae Park (5):
>>   MAINTAINERS: Fix a dead URL to ftp.kernel.org
>>   drivers/block: Fix a dead URL to ftp.kernel.org
>>   drivers/md: Fix a dead URL to ftp.kernel.org
>>   fs/autofs4: Fix a dead URL to ftp.kernel.org
>>   scripts: Fix dead URLs to ftp.kernel.org
>
> I guess the change be sent in a single patch to the trivial tree.

Sounds reasonable.  I will post the single patch as a reply to this mail.


Thanks,
SeongJae Park

>
> Michal
>
