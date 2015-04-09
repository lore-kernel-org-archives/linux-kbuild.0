Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:35367 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751656AbbDIHnj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Apr 2015 03:43:39 -0400
Received: by widdi4 with SMTP id di4so81944926wid.0
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Apr 2015 00:43:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <551D4FBC.5010007@suse.cz>
References: <cover.1427968988.git.riku.voipio@linaro.org>
	<834bd55c0de686780eb15f9a06b13f7fb560e9a8.1427968988.git.riku.voipio@linaro.org>
	<87fv8i3fiw.fsf@lebrac.rtp-net.org>
	<CAAqcGH=iT4-R=D+WWCZ2ibKHnc8dGgHPyC+5WyOT2WM=LuJwRA@mail.gmail.com>
	<551D4FBC.5010007@suse.cz>
Date: Thu, 9 Apr 2015 10:43:38 +0300
Message-ID: <CAAqcGHnRVDU+7Nhd37TK98BwjefY1+MSTSm6bRyzA11akV7idw@mail.gmail.com>
Subject: Re: [PATCH 1/4] deb-pkg: Add automatic support for armhf architecture
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Arnaud Patard <arnaud.patard@rtp-net.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>, Ben Hutchings <ben@decadent.org.uk>, debian-arm@lists.debian.org

On 2 April 2015 at 17:18, Michal Marek <mmarek@suse.cz> wrote:
> On 2015-04-02 15:14, Riku Voipio wrote:
>> On 2 April 2015 at 15:01, Arnaud Patard <arnaud.patard@rtp-net.org> wrote:
>>> riku.voipio@linaro.org writes:
>>>> --- a/scripts/package/builddeb
>>>> +++ b/scripts/package/builddeb
>>>> @@ -45,7 +45,16 @@ create_package() {
>>>>       arm64)
>>>>               debarch=arm64 ;;
>>>>       arm*)
>>>> -             debarch=arm$(grep -q CONFIG_AEABI=y $KCONFIG_CONFIG && echo el || true) ;;
>>>> +             if grep -q CONFIG_AEABI=y $KCONFIG_CONFIG; then
>>>> +                     if $CC -dM -E - < /dev/null|grep -q __ARM_PCS_VFP; then
>>>
>>> Actually, I guess there's nothing preventing you building a armhf kernel
>>> with a compiler not having __ARM_PCS_VFP defined by default, but I'm not sure
>>> we should take care of this case. One can always use KBUILD_DEBARCH=armhf.
>>
>> I think the common use cases would be a) native compilers or b)
>> cross-compiler targeting the same debian architecture as the rootfs.
>> This patch provides automatic detection for both cases.

> $CC should be used together with $KBUILD_CFLAGS to behave the same as
> when building the kernel.

I just tested and it won't work. $KBUILD_CFLAGS has -msoft-float so
__ARM_PCS_VFP wont be set. Which makes sense - we wouldn't want kernel
to pass anything in float registers. Given the constraint, would you
prefer Ben's original patch that checks CONFIG_VFP[1], or my version
using CC without KBUILD_CFLAGS?

[1] https://lists.debian.org/debian-arm/2014/06/msg00016.html

Riku
