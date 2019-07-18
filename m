Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:57394 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728022AbfGRUSg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Jul 2019 16:18:36 -0400
Subject: Re: [PATCH v2 08/11] kbuild: create *.mod with full directory path
 and remove MODVERDIR
References: <20190711054434.1177-1-yamada.masahiro@socionext.com>
 <20190711054434.1177-9-yamada.masahiro@socionext.com>
 <20190716214023.GA15159@redhat.com>
 <CAK7LNAQ41NhPPO6xoVObgFctTO6WewSXPfZkE7_bZXsdAtKSpA@mail.gmail.com>
From: Joe Lawrence <joe.lawrence@redhat.com>
Message-ID: <f1222c8a-9301-1e76-981d-a36e8687a29f@redhat.com>
Date: Thu, 18 Jul 2019 16:18:33 -0400
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQ41NhPPO6xoVObgFctTO6WewSXPfZkE7_bZXsdAtKSpA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nico@fluxnic.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On 7/17/19 1:21 AM, Masahiro Yamada wrote:
>> Hi Masahiro,
>>
>> I'm following this patchset changes as they will affect the klp-convert
>> series [1] that the livepatching folks have been working on...
> 
> Empty files .tmp_versions/*.livepatch are touched
> to keep track of 'LIVEPATCH_* := y', right?
> 

Pretty much.  From that patchset I think the rework would need to  modify..

- [PATCH v4 02/10] kbuild: Support for Symbols.list creation: creates a 
Symbols.list file of kernel and module symbols, but *not* including any 
from LIVEPATCH_* modules.

- [PATCH v4 05/10] modpost: Integrate klp-convert: if a LIVEPATCH_* 
module has changed, call a newly introduced klp-convert script on it.

- [PATCH v4 06/10] modpost: Add modinfo flag to livepatch modules: find 
any LIVEPATCH_* mod, add it to a livepatchmods file, then pass that file 
to modpost

> Perhaps, adding a new field
> to *.mod files might be cleaner.

I can look into that.  By "field" you mean a new row in the file?

Regards,

-- Joe
