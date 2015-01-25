Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail2.vodafone.ie ([213.233.128.44]:23118 "EHLO
	mail2.vodafone.ie" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752403AbbAYCNm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 24 Jan 2015 21:13:42 -0500
Message-ID: <54C45153.2050703@draigBrady.com>
Date: Sun, 25 Jan 2015 02:13:39 +0000
From: =?UTF-8?B?UMOhZHJhaWcgQnJhZHk=?= <P@draigBrady.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2] modsign: use shred to overwrite the private key before
 deleting it
References: <54C2F4F8.20809@draigBrady.com> <1422096327-4483-1-git-send-email-holler@ahsoftware.de> <54C383E0.9060408@ahsoftware.de> <54C38B6D.1060806@ahsoftware.de> <54C3901D.8040406@ahsoftware.de>
In-Reply-To: <54C3901D.8040406@ahsoftware.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Holler <holler@ahsoftware.de>, linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, David Howells <dhowells@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>

On 24/01/15 12:29, Alexander Holler wrote:
> Am 24.01.2015 um 13:09 schrieb Alexander Holler:
>> Am 24.01.2015 um 12:37 schrieb Alexander Holler:
>>> Am 24.01.2015 um 11:45 schrieb Alexander Holler:
>>>
>>>> It uses shred, in the hope it will somedays learn how to shred stuff on
>>>> FLASH based devices securely too, once that has become possible.
>>>
>>> BTW: This is a good example where technology failed to keep the needs of
>>> users in mind.
>>
>> Failed completely.
>>
>> Since ever it's a problem for people to securely delete files on storage.
>>
>> Also it should be very simple to securely erase files on block based
>> devices, people have to try cruel ways in the hope to get securely rid
>> of files nobody else should be able to see ever again.
>>
>> It's almost unbelievable how completely the IT industry (including the
>> field I'm working myself: SW) failed in regard to that since 30 years or
>> even more.
> 
> And it isn't such that this is a new requirement. Humans are doing such 
> since thousands of years. They use fire to get rid of paper documents 
> and even the old egypts were able to destroyed stuff on stones by using 
> simple steps. Just the IT failed completely.
> 
> Really unbelievable.
> 
> So, sorry if anyone got bored by this mail, but I think that really has 
> to be said and repeated.

Well not failed completely, just used a different method (encryption).

As for "shredding", that improves in effectiveness the lower you go.
I.E. it's effective for the whole file system (SSD range), or whole device.

Pádraig.
