Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:35865 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753081AbbDBNOK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Apr 2015 09:14:10 -0400
Received: by wizk4 with SMTP id k4so14833967wiz.1
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2015 06:14:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87fv8i3fiw.fsf@lebrac.rtp-net.org>
References: <cover.1427968988.git.riku.voipio@linaro.org>
	<834bd55c0de686780eb15f9a06b13f7fb560e9a8.1427968988.git.riku.voipio@linaro.org>
	<87fv8i3fiw.fsf@lebrac.rtp-net.org>
Date: Thu, 2 Apr 2015 16:14:08 +0300
Message-ID: <CAAqcGH=iT4-R=D+WWCZ2ibKHnc8dGgHPyC+5WyOT2WM=LuJwRA@mail.gmail.com>
Subject: Re: [PATCH 1/4] deb-pkg: Add automatic support for armhf architecture
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Patard <arnaud.patard@rtp-net.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, mmarek <mmarek@suse.cz>, debian-kernel <debian-kernel@lists.debian.org>, Ben Hutchings <ben@decadent.org.uk>, debian-arm@lists.debian.org

On 2 April 2015 at 15:01, Arnaud Patard <arnaud.patard@rtp-net.org> wrote:
> riku.voipio@linaro.org writes:
>> --- a/scripts/package/builddeb
>> +++ b/scripts/package/builddeb
>> @@ -45,7 +45,16 @@ create_package() {
>>       arm64)
>>               debarch=arm64 ;;
>>       arm*)
>> -             debarch=arm$(grep -q CONFIG_AEABI=y $KCONFIG_CONFIG && echo el || true) ;;
>> +             if grep -q CONFIG_AEABI=y $KCONFIG_CONFIG; then
>> +                     if $CC -dM -E - < /dev/null|grep -q __ARM_PCS_VFP; then
>
> Actually, I guess there's nothing preventing you building a armhf kernel
> with a compiler not having __ARM_PCS_VFP defined by default, but I'm not sure
> we should take care of this case. One can always use KBUILD_DEBARCH=armhf.

I think the common use cases would be a) native compilers or b)
cross-compiler targeting the same debian architecture as the rootfs.
This patch provides automatic detection for both cases. For corner
cases, one will have to manually specify KBUILD_DEBARCH - which one
already had to do if one was targeting armhf.

Riku
