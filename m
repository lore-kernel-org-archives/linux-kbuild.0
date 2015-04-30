Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from a.ns.miles-group.at ([95.130.255.143]:65275 "EHLO radon.swed.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750794AbbD3Mdv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 30 Apr 2015 08:33:51 -0400
Message-ID: <5542212C.70102@nod.at>
Date: Thu, 30 Apr 2015 14:33:48 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
Subject: Re: [RFC] scripts: kerrno.sh - errno translator
References: <1430391215-13768-1-git-send-email-bgolaszewski@baylibre.com> <CAFLxGvyjMBRAa-hJgZ8=nNs-wwZ+fdkjwJSuS5tOXoLEgieDnw@mail.gmail.com> <CAMpxmJUPECzDboHM5YgTnukQn0PK+MeuQonqQVXKCfmTMQDiKw@mail.gmail.com> <20150430122512.GE4996@twin.jikos.cz>
In-Reply-To: <20150430122512.GE4996@twin.jikos.cz>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: dsterba@suse.cz, Bartosz Golaszewski <bgolaszewski@baylibre.com>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Am 30.04.2015 um 14:25 schrieb David Sterba:
> On Thu, Apr 30, 2015 at 01:29:41PM +0200, Bartosz Golaszewski wrote:
>> 2015-04-30 13:04 GMT+02:00 Richard Weinberger <richard.weinberger@gmail.com>:
>>> On Thu, Apr 30, 2015 at 12:53 PM, Bartosz Golaszewski
>>> <bgolaszewski@baylibre.com> wrote:
>>>> Shell script allowing to find errno definitions and descriptions in the
>>>> kernel source.
>>>>
>>>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>> ---
>>>> This is a simple script I use when seeing messages like:
>>>>
>>>>         some_func() failed: -123
>>>
>>> What is wrong with a one-liner like:
>>> gcc -E -dD - < include/uapi/linux/errno.h |grep -E "^#define E.* 123$"
>>
>> Nothing really - the output is less nice, that's all.
> 
> I'd find a helper script useful in situations where I don't know the
> error code immediatelly and have to convert it from a hexa value first.
> Eg. when RAX contains an error code after a BUG_ON:
> 
> RAX: 00000000ffffffe4
> 
> this translates to -28 == -ENOSPC.

You mean a script where you can pipe a register dump into and it tries to
translate all registers values to meaningful values?
Yes, that would be nice... :)

Thanks,
//richard
