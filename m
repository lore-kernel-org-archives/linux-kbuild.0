Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:39741 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756263Ab3EALR5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 1 May 2013 07:17:57 -0400
Message-ID: <5180F9FB.8010307@ti.com>
Date: Wed, 1 May 2013 07:18:19 -0400
From: Tom Rini <trini@ti.com>
MIME-Version: 1.0
Subject: Re: [PATCH] modpost.c: Add .text.unlikely to TEXT_SECTIONS
References: <1366842363-7513-1-git-send-email-trini@ti.com> <87sj2aca9r.fsf@rustcorp.com.au> <517E7260.5070204@ti.com> <87ppxbxwzg.fsf@rustcorp.com.au>
In-Reply-To: <87ppxbxwzg.fsf@rustcorp.com.au>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kbuild@vger.kernel.org

On 04/30/2013 10:19 PM, Rusty Russell wrote:
> Tom Rini <trini@ti.com> writes:
>> On 04/28/2013 10:59 PM, Rusty Russell wrote:
>>> Tom Rini <trini@ti.com> writes:
>>>
>>>> Recent gcc's may place functions into the .text.unlikely section and we
>>>> need to check this section as well for section mismatches now otherwise
>>>> we may have false negatives for this test.
>>>
>>> Hmm, I don't think it's all that recent, is it?  I can find it back to
>>> gcc 4.0.4:
>>>
>>> `-freorder-functions'
>>>      Reorder functions in the object file in order to improve code
>>>      locality.  This is implemented by using special subsections
>>>      `.text.hot' for most frequently executed functions and
>>>      `.text.unlikely' for unlikely executed functions.  Reordering is
>>>      done by the linker so object file format must support named
>>>      sections and linker must place them in a reasonable way.
>>>
>>>      Also profile feedback must be available in to make this option
>>>      effective.  See `-fprofile-arcs' for details.
>>>
>>>      Enabled at levels `-O2', `-O3', `-Os'.
>>>
>>> The comment is the same in in gcc 4.7.
>>>
>>> So is your real issue that this section is generated with
>>> -fprofile-arcs, or has something changed with gcc 4.8, or...?
>>
>> I've started seeing this with Linaro based 4.7 toolchains.  I can go
>> back through their releases and see when it starts showing up there if
>> it helps.  I didn't add .text.hot as I didn't have that section at all,
>> fwiw.
> 
> Weird, did you turn on CONFIG_GCOV_KERNEL?  AFAICT you shouldn't see
> this section without that.

Nope, CONFIG_GCOV_KERNEL is off.  Must be related to whatever flags the
Linaro folks set as default on -O2 (at least in their 2013.03 release),
after reading over one of the .o.cmd files in the build.

Do you want me to re-word the commit message a bit or ?  Thanks!

-- 
Tom
