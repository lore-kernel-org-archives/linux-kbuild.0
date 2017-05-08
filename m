Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:38222 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751094AbdEHXwL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 May 2017 19:52:11 -0400
Subject: Re: [PATCH v2] Fix ctype(3) usage in the kconfig code on NetBSD
From: Randy Dunlap <rdunlap@infradead.org>
References: <1457397085-10907-1-git-send-email-n54@gmx.com>
 <20170507134422.2666-1-n54@gmx.com>
 <b2a75122-5762-542e-14b8-c6ef459b0825@gmx.com>
 <0857dbdf-d62f-c290-37ca-727fc2b1696b@infradead.org>
Message-ID: <a0bc2b55-0985-49a3-067d-5e7c1eb3ee5e@infradead.org>
Date: Mon, 8 May 2017 16:52:04 -0700
MIME-Version: 1.0
In-Reply-To: <0857dbdf-d62f-c290-37ca-727fc2b1696b@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kamil Rytarowski <n54@gmx.com>, linux-kbuild@vger.kernel.org
Cc: yann.morin.1998@free.fr, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

On 05/07/17 17:04, Randy Dunlap wrote:
> 
> Patch makes sense to me. I haven't tested it but I can.

Tested-by: Randy Dunlap <rdunlap@infradead.org>


> A bigger problem is who will merge it.  Yann has relinquished the
> maintainership of kconfig (see http://marc.info/?l=linux-kbuild&m=149185505605964&w=2).
> (That patch needs to be merged also.)
> 
> and the kbuild maintainer is not maintaining kconfig IIRC.
> 
> Andrew, would you push this patch?  and the one for the MAINTAINERS file?
> (http://marc.info/?l=linux-kbuild&m=149419921910871&w=2)
> 
> 
> 
> On 05/07/17 06:59, Kamil Rytarowski wrote:
>> I've rebased the patch to the current HEAD.
>>
>> This is general yearly PING...
>>
>> On 07.05.2017 15:44, Kamil Rytarowski wrote:
>>> The current code produces set of warnings on NetBSD-7.99.25 (GCC 4.8.5):
>>>

>>>
>>> Signed-off-by: Kamil Rytarowski <n54@gmx.com>
>>> ---
>>>  scripts/basic/fixdep.c               |  2 +-
>>>  scripts/kconfig/conf.c               |  6 +++---
>>>  scripts/kconfig/confdata.c           |  9 +++++----
>>>  scripts/kconfig/expr.c               |  3 ++-
>>>  scripts/kconfig/lxdialog/checklist.c |  3 ++-
>>>  scripts/kconfig/lxdialog/inputbox.c  |  3 ++-
>>>  scripts/kconfig/lxdialog/menubox.c   | 11 +++++++----
>>>  scripts/kconfig/lxdialog/util.c      |  5 +++--
>>>  scripts/kconfig/menu.c               |  4 ++--
>>>  scripts/kconfig/nconf.c              |  3 ++-
>>>  scripts/kconfig/nconf.gui.c          |  3 ++-
>>>  scripts/kconfig/symbol.c             |  8 ++++----
>>>  12 files changed, 35 insertions(+), 25 deletions(-)


-- 
~Randy
