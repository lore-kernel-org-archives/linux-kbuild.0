Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:32640 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751138AbdFVBTn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Jun 2017 21:19:43 -0400
MIME-Version: 1.0
In-Reply-To: <CAD=FV=V1XGwkETV=L6ye_-M8nyDOyJeb0ugnyoE7wC8gUNoAEQ@mail.gmail.com>
References: <20170421213931.155210-1-mka@chromium.org> <20170421213931.155210-2-mka@chromium.org>
 <CAD=FV=V1XGwkETV=L6ye_-M8nyDOyJeb0ugnyoE7wC8gUNoAEQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 22 Jun 2017 10:19:35 +0900
Message-ID: <CAK7LNATqQt99-ryCE5ec=LwExTAN8jbh8FBYbjr15D71y79ZXg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: clang: Disable 'address-of-packed-member' warning
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>

2017-05-17 6:32 GMT+09:00 Doug Anderson <dianders@chromium.org>:
> Hi,
>
> On Fri, Apr 21, 2017 at 2:39 PM, Matthias Kaehlcke <mka@chromium.org> wrote:
>> clang generates plenty of these warnings in different parts of the code,
>> to an extent that the warnings are little more than noise. Disable the
>> 'address-of-packed-member' warning.
>>
>> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
>> ---
>>  Makefile | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Makefile b/Makefile
>> index 5039b9148d15..df5abf346354 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -703,6 +703,7 @@ KBUILD_CPPFLAGS += $(call cc-option,-Wno-unknown-warning-option,)
>>  KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
>>  KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
>>  KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
>> +KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
>>  # Quiet clang warning: comparison of unsigned expression < 0 is always false
>>  KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
>>  # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
>
> Though I'm no expert, after reading the discussion on this thread and
> looking at the examples provided by Matthias, this seems sane to me.
> Thus, FWIW:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>


1/2 applied to linux-kbuild/kbuild.  Thanks!


-- 
Best Regards
Masahiro Yamada
