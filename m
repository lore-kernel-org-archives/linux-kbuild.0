Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:49896 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750747AbdEJA1E (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 May 2017 20:27:04 -0400
Subject: Re: sparse on scripts/kconfig/*.c
References: <fa98e27a-c08d-170f-68d1-2ab2918ef5d1@infradead.org>
 <20170509201714.GA24001@infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d799e97d-36de-67c8-3740-41482b279c0b@infradead.org>
Date: Tue, 9 May 2017 17:27:01 -0700
MIME-Version: 1.0
In-Reply-To: <20170509201714.GA24001@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, LKML <linux-kernel@vger.kernel.org>

On 05/09/17 13:17, Christoph Hellwig wrote:
> On Tue, May 09, 2017 at 09:47:41AM -0700, Randy Dunlap wrote:
>> Hi,
>>
>> I've been attempting to run sparse on the kconfig/ C files -- without success.
>>
>> The kbuild files don't try to support CHECK in scripts/kconfig/ AFAICT,
>> and just running sparse on the C files has issues with not being able to
>> find header files.
>>
>> Has anyone done this?  Any clues about how to do it?
> 
> As a wild guess from using sparse on various userspace projects:
> 
> have you tried simply setting HOSTCC to cgcc?

I don't quite see what that has to do with running sparse ($CHECK, not $HOSTCC).

Anyway, I tried it and got the same message:

nconf.h:19:11: error: unable to open 'menu.h'


thanks.
-- 
~Randy
